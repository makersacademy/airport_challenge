# encoding: utf-8

module RuboCop
  # This class handles the processing of files, which includes dealing with
  # formatters and letting cops inspect the files.
  class Runner # rubocop:disable Metrics/ClassLength
    # An exception indicating that the inspection loop got stuck correcting
    # offenses back and forth.
    class InfiniteCorrectionLoop < Exception
      attr_reader :offenses

      def initialize(path, offenses)
        super "Infinite loop detected in #{path}."
        @offenses = offenses
      end
    end

    attr_reader :errors, :aborting
    alias_method :aborting?, :aborting

    def initialize(options, config_store)
      @options = options
      @config_store = config_store
      @errors = []
      @aborting = false
    end

    def run(paths)
      target_files = find_target_files(paths)
      if @options[:list_target_files]
        list_files(target_files)
      else
        inspect_files(target_files)
      end
    end

    def abort
      @aborting = true
    end

    private

    def find_target_files(paths)
      target_finder = TargetFinder.new(@config_store, @options)
      target_files = target_finder.find(paths)
      target_files.each(&:freeze).freeze
    end

    def inspect_files(files)
      inspected_files = []
      all_passed = true

      formatter_set.started(files)

      files.each do |file|
        break if aborting?
        offenses = process_file(file)
        all_passed = false if offenses.any? { |o| considered_failure?(o) }
        inspected_files << file
        break if @options[:fail_fast] && !all_passed
      end

      all_passed
    ensure
      ResultCache.cleanup(@config_store, @options[:debug]) if cached_run?
      formatter_set.finished(inspected_files.freeze)
      formatter_set.close_output_files
    end

    def list_files(paths)
      paths.each do |path|
        puts PathUtil.relative_path(path)
      end
    end

    def process_file(file)
      puts "Scanning #{file}" if @options[:debug]

      cache = ResultCache.new(file, @options, @config_store) if cached_run?
      if cache && cache.valid?
        offenses, disabled_line_ranges, comments = cache.load
        file_started(file, disabled_line_ranges, comments)
      else
        processed_source = get_processed_source(file)
        file_started(file, processed_source.disabled_line_ranges,
                     processed_source.comments)
        offenses = do_inspection_loop(file, processed_source)
        if cache
          cache.save(offenses, processed_source.disabled_line_ranges,
                     processed_source.comments)
        end
      end

      offenses = formatter_set.file_finished(file, offenses.compact.sort.freeze)

      offenses
    rescue InfiniteCorrectionLoop => e
      formatter_set.file_finished(file, e.offenses.compact.sort.freeze)
      raise
    end

    def file_started(file, disabled_line_ranges, comments)
      formatter_set.file_started(file,
                                 cop_disabled_line_ranges: disabled_line_ranges,
                                 comments: comments,
                                 cli_options: @options,
                                 config_store: @config_store)
    end

    def cached_run?
      @cached_run ||=
        (@options[:cache] == 'true' ||
         @options[:cache] != 'false' &&
         @config_store.for(Dir.pwd)['AllCops']['UseCache']) &&
        # When running --auto-gen-config, there's some processing done in the
        # cops related to calculating the Max parameters for Metrics cops. We
        # need to do that processing and can not use caching.
        !@options[:auto_gen_config] &&
        # Auto-correction needs a full run. It can not use cached results.
        !@options[:auto_correct]
    end

    def do_inspection_loop(file, processed_source)
      offenses = []

      # Keep track of the state of the source. If a cop modifies the source
      # and another cop undoes it producing identical source we have an
      # infinite loop.
      @processed_sources = []

      # When running with --auto-correct, we need to inspect the file (which
      # includes writing a corrected version of it) until no more corrections
      # are made. This is because automatic corrections can introduce new
      # offenses. In the normal case the loop is only executed once.
      loop do
        check_for_infinite_loop(processed_source, offenses)

        # The offenses that couldn't be corrected will be found again so we
        # only keep the corrected ones in order to avoid duplicate reporting.
        offenses.select!(&:corrected?)
        new_offenses, updated_source_file = inspect_file(processed_source)
        offenses.concat(new_offenses).uniq!

        # We have to reprocess the source to pickup the changes. Since the
        # change could (theoretically) introduce parsing errors, we break the
        # loop if we find any.
        break unless updated_source_file

        processed_source = get_processed_source(file)
      end

      offenses
    end

    # Check whether a run created source identical to a previous run, which
    # means that we definitely have an infinite loop.
    def check_for_infinite_loop(processed_source, offenses)
      checksum = processed_source.checksum

      if @processed_sources.include?(checksum)
        fail InfiniteCorrectionLoop.new(processed_source.path, offenses)
      end

      @processed_sources << checksum
    end

    def inspect_file(processed_source)
      config = @config_store.for(processed_source.path)
      team = Cop::Team.new(mobilized_cop_classes(config), config, @options)
      offenses = team.inspect_file(processed_source)
      @errors.concat(team.errors)
      [offenses, team.updated_source_file?]
    end

    def mobilized_cop_classes(config)
      @mobilized_cop_classes ||= {}
      @mobilized_cop_classes[config.object_id] ||= begin
        cop_classes = Cop::Cop.all

        [:only, :except].each { |opt| Options.validate_cop_list(@options[opt]) }

        if @options[:only]
          cop_classes.select! { |c| c.match?(@options[:only]) }
        else
          filter_cop_classes(cop_classes, config)
        end

        cop_classes.reject! { |c| c.match?(@options[:except]) }

        cop_classes
      end
    end

    def filter_cop_classes(cop_classes, config)
      # use only cops that link to a style guide if requested
      if style_guide_cops_only?(config)
        cop_classes.select! { |cop| config.for_cop(cop)['StyleGuide'] }
      end

      # filter out Rails cops unless requested
      cop_classes.reject!(&:rails?) unless run_rails_cops?(config)
    end

    def run_rails_cops?(config)
      @options[:rails] || config['AllCops']['RunRailsCops']
    end

    def style_guide_cops_only?(config)
      @options[:only_guide_cops] || config['AllCops']['StyleGuideCopsOnly']
    end

    def formatter_set
      @formatter_set ||= begin
        set = Formatter::FormatterSet.new
        pairs = @options[:formatters] || [[Options::DEFAULT_FORMATTER]]
        pairs.each do |formatter_key, output_path|
          set.add_formatter(formatter_key, output_path)
        end
        set
      rescue => error
        warn error.message
        $stderr.puts error.backtrace
        exit(1)
      end
    end

    def considered_failure?(offense)
      # For :autocorrect level, any offense - corrected or not - is a failure.
      return false if offense.disabled?

      return true if @options[:fail_level] == :autocorrect

      !offense.corrected? && offense.severity >= minimum_severity_to_fail
    end

    def minimum_severity_to_fail
      @minimum_severity_to_fail ||= begin
        name = @options[:fail_level] || :refactor
        RuboCop::Cop::Severity.new(name)
      end
    end

    def get_processed_source(file)
      return ProcessedSource.new(@options[:stdin], file) if @options[:stdin]
      ProcessedSource.from_file(file)
    end
  end
end
