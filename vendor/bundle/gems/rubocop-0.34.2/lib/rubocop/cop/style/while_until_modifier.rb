# encoding: utf-8

module RuboCop
  module Cop
    module Style
      # Checks for while and until statements that would fit on one line
      # if written as a modifier while/until.
      # The maximum line length is configurable.
      class WhileUntilModifier < Cop
        include StatementModifier

        def on_while(node)
          check(node)
        end

        def on_until(node)
          check(node)
        end

        def autocorrect(node)
          cond, body = *node
          oneline = "#{body.loc.expression.source} " \
                    "#{node.loc.keyword.source} " +
                    cond.loc.expression.source
          ->(corrector) { corrector.replace(node.loc.expression, oneline) }
        end

        private

        def check(node)
          return unless node.loc.end
          return unless fit_within_line_as_modifier_form?(node)
          add_offense(node, :keyword, message(node.loc.keyword.source))
        end

        def message(keyword)
          "Favor modifier `#{keyword}` usage when having a single-line body."
        end
      end
    end
  end
end
