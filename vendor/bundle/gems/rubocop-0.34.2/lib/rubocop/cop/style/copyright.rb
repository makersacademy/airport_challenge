# encoding: utf-8

module RuboCop
  module Cop
    module Style
      # Check that a copyright notice was given in each source file.
      #
      # The default regexp for an acceptable copyright notice can be found in
      # config/default.yml.  The default can be changed as follows:
      #
      # Style/Copyright:
      #   Notice: '^Copyright (\(c\) )?2\d{3} Acme Inc'
      #
      # This regex string is treated as an unanchored regex.  For each file
      # that RuboCop scans, a comment that matches this regex must be found or
      # an offense is reported.
      #
      class Copyright < Cop
        def message
          "Include a copyright notice matching /#{notice}/" \
          'before any code.'
        end

        def notice
          cop_config['Notice']
        end

        def autocorrect_notice
          cop_config['AutocorrectNotice']
        end

        def investigate(processed_source)
          return if notice.empty?
          return if notice_found?(processed_source)
          range = source_range(processed_source.buffer, 1, 0)
          add_offense(insert_notice_before(processed_source), range, message)
        end

        def insert_notice_before(processed_source)
          token_index = 0
          token_index += 1 if shebang_token?(processed_source, token_index)
          token_index += 1 if encoding_token?(processed_source, token_index)
          processed_source.tokens[token_index]
        end

        def shebang_token?(processed_source, token_index)
          return false if token_index >= processed_source.tokens.size
          token = processed_source.tokens[token_index]
          token.type == :tCOMMENT && token.text =~ /^#!.*$/
        end

        def encoding_token?(processed_source, token_index)
          return false if token_index >= processed_source.tokens.size
          token = processed_source.tokens[token_index]
          token.type == :tCOMMENT &&
            token.text =~ /^#.*coding\s?[:=]\s?(?:UTF|utf)-8/
        end

        def notice_found?(processed_source)
          notice_found = false
          notice_regexp = Regexp.new(notice)
          processed_source.tokens.each do |token|
            break unless token.type == :tCOMMENT
            notice_found = !((token.text =~ notice_regexp).nil?)
            break if notice_found
          end
          notice_found
        end

        def autocorrect(token)
          fail 'An AutocorrectNotice must be defined in ' \
            'your RuboCop config' if autocorrect_notice.empty?
          fail "AutocorrectNotice '#{autocorrect_notice}' must match " \
            "Notice /#{notice}/" unless autocorrect_notice =~ Regexp.new(notice)
          lambda do |corrector|
            if token.nil?
              range = Parser::Source::Range.new('', 0, 0)
            else
              range = token.pos
            end
            corrector.insert_before(range, "#{autocorrect_notice}\n")
          end
        end
      end
    end
  end
end
