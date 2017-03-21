# encoding: utf-8

module RuboCop
  module Cop
    module Style
      # This cop checks for uses of rescue in its modifier form.
      class RescueModifier < Cop
        include AutocorrectAlignment

        MSG = 'Avoid using `rescue` in its modifier form.'

        def investigate(processed_source)
          @modifier_locations = processed_source.tokens
                                .select { |t| t.type == :kRESCUE_MOD }
                                .map(&:pos)
        end

        def on_resbody(node)
          return unless modifier?(node)
          add_offense(node.parent, :expression)
        end

        def autocorrect(node)
          operation, rescue_modifier, = *node
          *_, rescue_args = *rescue_modifier

          correction =
            "begin\n" <<
            indentation(node) << operation.loc.expression.source <<
            "\n#{offset(node)}rescue\n" <<
            indentation(node) << rescue_args.loc.expression.source <<
            "\n#{offset(node)}end"
          range = Parser::Source::Range.new(node.loc.expression.source_buffer,
                                            node.loc.expression.begin_pos,
                                            node.loc.expression.end_pos)

          lambda do |corrector|
            corrector.replace(range, correction)
          end
        end

        private

        def modifier?(node)
          return false unless @modifier_locations.respond_to?(:include?)
          @modifier_locations.include?(node.loc.keyword)
        end
      end
    end
  end
end
