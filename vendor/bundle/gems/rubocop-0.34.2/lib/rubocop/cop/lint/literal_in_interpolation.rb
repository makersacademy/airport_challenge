# encoding: utf-8

module RuboCop
  module Cop
    module Lint
      # This cop checks for interpolated literals.
      #
      # @example
      #
      #   "result is #{10}"
      class LiteralInInterpolation < Cop
        LITERALS = [:str, :dstr, :int, :float, :array,
                    :hash, :regexp, :nil, :true, :false]

        MSG = 'Literal interpolation detected.'

        def on_dstr(node)
          node.children.select { |n| n.type == :begin }.each do |begin_node|
            final_node = begin_node.children.last
            next unless final_node
            next if special_keyword?(final_node)
            next unless LITERALS.include?(final_node.type)

            add_offense(final_node, :expression)
          end
        end

        def autocorrect(node)
          expr = node.parent.loc.expression
          value = autocorrected_value(node)
          ->(corrector) { corrector.replace(expr, value) }
        end

        private

        def special_keyword?(node)
          # handle strings like __FILE__
          (node.type == :str && !node.loc.respond_to?(:begin)) ||
            node.loc.expression.is?('__LINE__')
        end

        def autocorrected_value(node)
          node.str_type? ? node.children.last : node.loc.expression.source
        end
      end
    end
  end
end
