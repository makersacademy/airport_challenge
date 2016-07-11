# encoding: utf-8

module RuboCop
  module Cop
    module Style
      # This cop checks whether some constant value isn't a
      # mutable literal (e.g. array or hash).
      #
      # @example
      #   # bad
      #   CONST = [1, 2, 3]
      #
      #   # good
      #   CONST = [1, 2, 3].freeze
      class MutableConstant < Cop
        MSG = 'Freeze mutable objects assigned to constants.'

        MUTABLE_TYPES = [:array, :hash, :str, :dstr].freeze

        def on_casgn(node)
          _scope, _const_name, value = *node

          return if value && !MUTABLE_TYPES.include?(value.type)

          add_offense(value, :expression)
        end

        def autocorrect(node)
          expr = node.loc.expression
          ->(corrector) { corrector.replace(expr, "#{expr.source}.freeze") }
        end
      end
    end
  end
end
