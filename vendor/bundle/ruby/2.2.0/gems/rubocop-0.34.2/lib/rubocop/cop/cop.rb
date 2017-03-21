# encoding: utf-8

module RuboCop
  module Cop
    class AmbiguousCopName < Exception; end

    # Store for all cops with helper functions
    class CopStore < ::Array
      # @return [Array<String>] list of types for current cops.
      def types
        @types = map(&:cop_type).uniq! unless defined? @types
        @types
      end

      # @return [Array<Cop>] Cops for that specific type.
      def with_type(type)
        CopStore.new(select { |c| c.cop_type == type })
      end

      # @return [Array<Cop>] Cops not for a specific type.
      def without_type(type)
        CopStore.new(reject { |c| c.cop_type == type })
      end

      def qualified_cop_name(name, origin)
        @cop_names ||= Set.new(map(&:cop_name))
        basename = File.basename(name)
        found_ns = types.map(&:capitalize).select do |ns|
          @cop_names.include?("#{ns}/#{basename}")
        end

        case found_ns.size
        when 0 then name # No namespace found. Deal with it later in caller.
        when 1 then cop_name_with_namespace(name, origin, basename, found_ns[0])
        else fail AmbiguousCopName, "`#{basename}` used in #{origin}"
        end
      end

      def cop_name_with_namespace(name, origin, basename, found_ns)
        if name != basename && found_ns != File.dirname(name).to_sym
          warn "#{origin}: #{name} has the wrong namespace - should be " \
               "#{found_ns}"
        end
        "#{found_ns}/#{basename}"
      end
    end

    # A scaffold for concrete cops.
    #
    # The Cop class is meant to be extended.
    #
    # Cops track offenses and can autocorrect them of the fly.
    #
    # A commissioner object is responsible for traversing the AST and invoking
    # the specific callbacks on each cop.
    # If a cop needs to do its own processing of the AST or depends on
    # something else, it should define the `#investigate` method and do
    # the processing there.
    #
    # @example
    #
    #   class CustomCop < Cop
    #     def investigate(processed_source)
    #       # Do custom processing
    #     end
    #   end
    class Cop
      extend AST::Sexp
      include Util
      include IgnoredNode
      include AutocorrectLogic

      attr_reader :config, :offenses, :corrections
      attr_accessor :processed_source # TODO: Bad design.

      @all = CopStore.new

      def self.all
        @all.without_type(:test)
      end

      def self.qualified_cop_name(name, origin)
        @all.qualified_cop_name(name, origin)
      end

      def self.non_rails
        all.without_type(:rails)
      end

      def self.inherited(subclass)
        @all << subclass
      end

      def self.cop_name
        @cop_name ||= name.to_s.split('::').last(2).join('/')
      end

      def self.cop_type
        name.to_s.split('::')[-2].downcase.to_sym
      end

      def self.lint?
        cop_type == :lint
      end

      def self.rails?
        cop_type == :rails
      end

      def initialize(config = nil, options = nil)
        @config = config || Config.new
        @options = options || { debug: false }

        @offenses = []
        @corrections = []
      end

      def join_force?(_force_class)
        false
      end

      def cop_config
        @config.for_cop(self)
      end

      def debug?
        @options[:debug]
      end

      def display_cop_names?
        debug? || @options[:display_cop_names] ||
          config['AllCops'] && config['AllCops']['DisplayCopNames']
      end

      def display_style_guide?
        (style_guide_url || reference_url) &&
          (@options[:display_style_guide] ||
            config['AllCops'] && config['AllCops']['DisplayStyleGuide'])
      end

      # Returns true if the cop name or the cop namespace matches any of the
      # given names.
      def self.match?(given_names)
        return false unless given_names

        given_names.include?(cop_name) ||
          given_names.include?(cop_type.to_s.capitalize)
      end

      def message(_node = nil)
        self.class::MSG
      end

      def add_offense(node, loc, message = nil, severity = nil)
        location = loc.is_a?(Symbol) ? node.loc.send(loc) : loc

        # Don't include the same location twice for one cop.
        return if @offenses.any? { |o| o.location == location }

        severity = custom_severity || severity || default_severity

        message ||= message(node)
        message = annotate_message(message)

        status = enabled_line?(location.line) ? correct(node) : :disabled

        @offenses << Offense.new(severity, location, message, name, status)
        yield if block_given? && status != :disabled
      end

      def correct(node)
        return :unsupported unless support_autocorrect?
        return :uncorrected unless autocorrect?

        correction = autocorrect(node)
        return :uncorrected unless correction
        @corrections << correction
        :corrected
      end

      def config_to_allow_offenses
        Formatter::DisabledConfigFormatter.config_to_allow_offenses[cop_name]
      end

      def config_to_allow_offenses=(hash)
        Formatter::DisabledConfigFormatter.config_to_allow_offenses[cop_name] =
          hash
      end

      def cop_name
        self.class.cop_name
      end

      alias_method :name, :cop_name

      def relevant_file?(file)
        file_name_matches_any?(file, 'Include', true) &&
          !file_name_matches_any?(file, 'Exclude', false)
      end

      def excluded_file?(file)
        !relevant_file?(file)
      end

      def style_guide_url
        url = cop_config && cop_config['StyleGuide']
        (url.nil? || url.empty?) ? nil : url
      end

      def reference_url
        url = cop_config && cop_config['Reference']
        (url.nil? || url.empty?) ? nil : url
      end

      private

      def annotate_message(message)
        message = "#{name}: #{message}" if display_cop_names?
        if display_style_guide?
          links = [style_guide_url, reference_url].compact.join(', ')
          message = "#{message} (#{links})"
        end
        message
      end

      def file_name_matches_any?(file, parameter, default_result)
        patterns = cop_config && cop_config[parameter]
        return default_result unless patterns
        path = nil
        patterns.any? do |pattern|
          # Try to match the absolute path, as Exclude properties are absolute.
          next true if match_path?(pattern, file, config.loaded_path)

          # Try with relative path.
          path ||= config.path_relative_to_config(file)
          match_path?(pattern, path, config.loaded_path)
        end
      end

      def enabled_line?(line_number)
        return true unless @processed_source
        @processed_source.comment_config.cop_enabled_at_line?(self, line_number)
      end

      def default_severity
        self.class.lint? ? :warning : :convention
      end

      def custom_severity
        severity = cop_config && cop_config['Severity']
        return unless severity

        if Severity::NAMES.include?(severity.to_sym)
          severity.to_sym
        else
          message = "Warning: Invalid severity '#{severity}'. " \
            "Valid severities are #{Severity::NAMES.join(', ')}."
          warn(Rainbow(message).red)
        end
      end
    end
  end
end
