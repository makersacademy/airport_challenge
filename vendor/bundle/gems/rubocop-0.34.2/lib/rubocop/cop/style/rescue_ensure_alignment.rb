# encoding: utf-8

module RuboCop
  module Cop
    module Style
      # This cop checks whether the rescue and ensure keywords are aligned
      # properly.
      #
      # @example
      #
      #   # bad
      #   begin
      #     something
      #     rescue
      #     puts 'error'
      #   end
      #
      #   # good
      #   begin
      #     something
      #   rescue
      #     puts 'error'
      #   end
      class RescueEnsureAlignment < Cop
        MSG = '`%s` at %d, %d is not aligned with `end` at %d, %d.'

        def on_resbody(node)
          check(node) unless modifier?(node)
        end

        def on_ensure(node)
          check(node)
        end

        def investigate(processed_source)
          @modifier_locations =
            processed_source.tokens.each_with_object([]) do |token, locations|
              next unless token.type == :kRESCUE_MOD
              locations << token.pos
            end
        end

        def autocorrect(node)
          source_buffer = node.loc.keyword.source_buffer
          begin_pos = node.loc.keyword.begin_pos
          current_column = node.loc.keyword.column
          whitespace = Parser::Source::Range.new(source_buffer,
                                                 begin_pos - current_column,
                                                 begin_pos)
          return false unless whitespace.source.strip.empty?

          new_column = ancestor_node(node).loc.end.column
          ->(corrector) { corrector.replace(whitespace, ' ' * new_column) }
        end

        private

        def check(node)
          end_loc = ancestor_node(node).loc.end
          return if end_loc.column == node.loc.keyword.column
          return if end_loc.line == node.loc.keyword.line

          kw_loc = node.loc.keyword

          add_offense(node, kw_loc,
                      format(MSG, kw_loc.source, kw_loc.line, kw_loc.column,
                             end_loc.line, end_loc.column))
        end

        def modifier?(node)
          return false unless @modifier_locations.respond_to?(:include?)
          @modifier_locations.include?(node.loc.keyword)
        end

        def ancestor_node(node)
          node.each_ancestor(:kwbegin, :def, :defs).first
        end
      end
    end
  end
end
