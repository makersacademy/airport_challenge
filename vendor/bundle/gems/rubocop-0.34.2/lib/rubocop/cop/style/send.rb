# encoding: utf-8

module RuboCop
  module Cop
    module Style
      # This cop checks for the use of the send method.
      class Send < Cop
        MSG = 'Prefer `Object#__send__` or `Object#public_send` to `send`.'

        def on_send(node)
          _receiver, method_name, *args = *node
          return unless method_name == :send && args.length > 0
          add_offense(node, :selector)
        end
      end
    end
  end
end
