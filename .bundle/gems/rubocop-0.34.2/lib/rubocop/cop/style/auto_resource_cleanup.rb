# encoding: utf-8

module RuboCop
  module Cop
    module Style
      # This cop checks for cases when you could use a block
      # accepting version of a method that does automatic
      # resource cleanup.
      #
      # @example
      #
      #   # bad
      #   f = File.open('file')
      #
      #   # good
      #   f = File.open('file') do
      #     ...
      #   end
      class AutoResourceCleanup < Cop
        include AST::Sexp
        MSG = 'Use the block version of `%s.%s`.'

        TARGET_METHODS = [
          [:File, :open]
        ]

        def on_send(node)
          receiver_node, method_name, *arg_nodes = *node

          TARGET_METHODS.each do |(target_class, target_method)|
            target_receiver = s(:const, nil, target_class)

            next if receiver_node != target_receiver
            next if method_name != target_method
            next if node.parent && node.parent.block_type?
            next if !arg_nodes.empty? && arg_nodes.last.block_pass_type?

            add_offense(node,
                        :expression,
                        format(MSG, target_class, target_method))
          end
        end
      end
    end
  end
end
