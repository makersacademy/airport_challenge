module RSpec
  module Core
    # @private
    class FilterManager
      attr_reader :exclusions, :inclusions

      def initialize
        @exclusions, @inclusions = FilterRules.build
      end

      # @api private
      #
      # @param file_path [String]
      # @param line_numbers [Array]
      def add_location(file_path, line_numbers)
        # locations is a hash of expanded paths to arrays of line
        # numbers to match against. e.g.
        #   { "path/to/file.rb" => [37, 42] }
        locations = inclusions.delete(:locations) || Hash.new { |h, k| h[k] = [] }
        locations[File.expand_path(file_path)].push(*line_numbers)
        inclusions.add(:locations => locations)
      end

      def empty?
        inclusions.empty? && exclusions.empty?
      end

      def prune(examples)
        examples = prune_conditionally_filtered_examples(examples)

        if inclusions.standalone?
          examples.select { |e| include?(e) }
        else
          locations, other_inclusions = inclusions.partition_locations

          examples.select do |e|
            priority_include?(e, locations) do
              !exclude?(e) && other_inclusions.include_example?(e)
            end
          end
        end
      end

      def exclude(*args)
        exclusions.add(args.last)
      end

      def exclude_only(*args)
        exclusions.use_only(args.last)
      end

      def exclude_with_low_priority(*args)
        exclusions.add_with_low_priority(args.last)
      end

      def include(*args)
        inclusions.add(args.last)
      end

      def include_only(*args)
        inclusions.use_only(args.last)
      end

      def include_with_low_priority(*args)
        inclusions.add_with_low_priority(args.last)
      end

    private

      def exclude?(example)
        exclusions.include_example?(example)
      end

      def include?(example)
        inclusions.include_example?(example)
      end

      def prune_conditionally_filtered_examples(examples)
        examples.reject do |ex|
          meta = ex.metadata
          !meta.fetch(:if, true) || meta[:unless]
        end
      end

      # When a user specifies a particular spec location, that takes priority
      # over any exclusion filters (such as if the spec is tagged with `:slow`
      # and there is a `:slow => true` exclusion filter), but only for specs
      # defined in the same file as the location filters. Excluded specs in
      # other files should still be excluded.
      def priority_include?(example, locations)
        return yield if locations[example.metadata[:absolute_file_path]].empty?
        MetadataFilter.filter_applies?(:locations, locations, example.metadata)
      end
    end

    # @private
    class FilterRules
      PROC_HEX_NUMBER = /0x[0-9a-f]+@/
      PROJECT_DIR = File.expand_path('.')

      attr_accessor :opposite
      attr_reader :rules

      def self.build
        exclusions = ExclusionRules.new
        inclusions = InclusionRules.new
        exclusions.opposite = inclusions
        inclusions.opposite = exclusions
        [exclusions, inclusions]
      end

      def initialize(rules={})
        @rules = rules
      end

      def add(updated)
        @rules.merge!(updated).each_key { |k| opposite.delete(k) }
      end

      def add_with_low_priority(updated)
        updated = updated.merge(@rules)
        opposite.each_pair { |k, v| updated.delete(k) if updated[k] == v }
        @rules.replace(updated)
      end

      def use_only(updated)
        updated.each_key { |k| opposite.delete(k) }
        @rules.replace(updated)
      end

      def clear
        @rules.clear
      end

      def delete(key)
        @rules.delete(key)
      end

      def fetch(*args, &block)
        @rules.fetch(*args, &block)
      end

      def [](key)
        @rules[key]
      end

      def empty?
        rules.empty?
      end

      def each_pair(&block)
        @rules.each_pair(&block)
      end

      def description
        rules.inspect.gsub(PROC_HEX_NUMBER, '').gsub(PROJECT_DIR, '.').gsub(' (lambda)', '')
      end

      def include_example?(example)
        MetadataFilter.apply?(:any?, @rules, example.metadata)
      end
    end

    # @private
    ExclusionRules = FilterRules

    # @private
    class InclusionRules < FilterRules
      def add(*args)
        apply_standalone_filter(*args) || super
      end

      def add_with_low_priority(*args)
        apply_standalone_filter(*args) || super
      end

      def use(*args)
        apply_standalone_filter(*args) || super
      end

      def partition_locations
        locations = @rules.fetch(:locations) { Hash.new([]) }
        other_inclusions = self.class.new(@rules.dup.tap { |r| r.delete(:locations) })

        return locations, other_inclusions
      end

      def include_example?(example)
        @rules.empty? || super
      end

      def standalone?
        is_standalone_filter?(@rules)
      end

    private

      def apply_standalone_filter(updated)
        return true if standalone?
        return nil unless is_standalone_filter?(updated)

        replace_filters(updated)
        true
      end

      def replace_filters(new_rules)
        @rules.replace(new_rules)
        opposite.clear
      end

      def is_standalone_filter?(rules)
        rules.key?(:full_description)
      end
    end
  end
end
