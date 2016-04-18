# encoding: utf-8

module RuboCop
  module Cop
    module Style
      # This cop checks for uses of "*" as a substitute for *join*.
      #
      # Not all cases can reliably checked, due to Ruby's dynamic
      # types, so we consider only cases when the first argument is an
      # array literal or the second is a string literal.
      class ArrayJoin < Cop
        MSG = 'Favor `Array#join` over `Array#*`.'

        def on_send(node)
          receiver_node, method_name, *arg_nodes = *node
          return unless receiver_node && receiver_node.type == :array &&
                        method_name == :* && arg_nodes[0].type == :str

          add_offense(node, :selector)
        end

        def autocorrect(node)
          receiver_node, _method_name, *arg_nodes = *node
          expr = node.loc.expression
          array = receiver_node.loc.expression.source
          join_arg  = arg_nodes[0].loc.expression.source

          lambda do |corrector|
            corrector.replace(expr, "#{array}.join(#{join_arg})")
          end
        end
      end
    end
  end
end
