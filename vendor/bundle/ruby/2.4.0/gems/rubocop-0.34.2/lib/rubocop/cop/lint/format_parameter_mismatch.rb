# encoding: utf-8

module RuboCop
  module Cop
    module Lint
      # This lint sees if there is a mismatch between the number of
      # expected fields for format/sprintf/#% and what is actually
      # passed as arguments.
      #
      # @example
      #
      #   format('A value: %s and another: %i', a_value)
      #
      class FormatParameterMismatch < Cop
        # http://rubular.com/r/CvpbxkcTzy
        MSG = 'Number arguments (%i) to `%s` mismatches expected fields (%i).'
        FIELD_REGEX = /(%(([\s#+-0\*])?(\d*)?(.\d+)?(\.)?[bBdiouxXeEfgGaAcps]|%))/.freeze # rubocop:disable Metrics/LineLength
        NAMED_FIELD_REGEX = /%\{[_a-zA-Z][_a-zA-Z]+\}/.freeze
        KERNEL = 'Kernel'.freeze
        SHOVEL = '<<'.freeze
        PERCENT = '%'.freeze
        PERCENT_PERCENT = '%%'.freeze
        SPLAT = '*'.freeze
        STRING_TYPES = [:str, :dstr].freeze

        def on_send(node)
          add_offense(node, :selector) if offending_node?(node)
        end

        private

        def offending_node?(node)
          return false unless called_on_string?(node)

          if sprintf?(node) || format?(node) || percent?(node)
            if named_mode?(node) || node_with_splat_args?(node)
              false
            else
              num_of_format_args, num_of_expected_fields = count_matches(node)
              num_of_expected_fields != num_of_format_args
            end
          else
            false
          end
        end

        def called_on_string?(node)
          receiver_node, _method, format_string, = *node
          if receiver_node.nil? || receiver_node.const_type?
            format_string && format_string.str_type?
          else
            receiver_node.str_type?
          end
        end

        def named_mode?(node)
          receiver_node, _method_name, *args = *node

          relevant_node = if sprintf?(node) || format?(node)
                            args.first
                          elsif percent?(node)
                            receiver_node
                          end

          relevant_node.loc.expression.source.scan(NAMED_FIELD_REGEX).size > 0
        end

        def node_with_splat_args?(node)
          return false if percent?(node)

          _receiver_node, _method_name, *args = *node

          args[1..-1].any? { |arg| arg.type == :splat }
        end

        def heredoc?(node)
          _receiver, _name, args = *node

          args.loc.expression.source[0, 2] == SHOVEL
        end

        def count_matches(node)
          receiver_node, _method_name, *args = *node

          if (sprintf?(node) || format?(node)) && !heredoc?(node)
            number_of_args_for_format = (args.size - 1)
            number_of_expected_fields = expected_fields_count(args.first)
          elsif percent?(node)
            first_child_argument = args.first

            if first_child_argument.array_type?
              number_of_args_for_format = args.first.child_nodes.size
              number_of_expected_fields = expected_fields_count(receiver_node)
            else
              number_of_args_for_format = 1
              number_of_expected_fields = expected_fields_count(receiver_node)
            end
          end

          [number_of_args_for_format, number_of_expected_fields]
        end

        def format_method?(name, node)
          receiver, method_name, *args = *node

          if receiver && receiver.const_type?
            return false unless receiver.loc.name.is?(KERNEL)
          end

          return false unless method_name == name

          args.size > 1 && args.first.str_type?
        end

        def expected_fields_count(node)
          node
            .loc
            .expression
            .source
            .scan(FIELD_REGEX)
            .select { |x| x.first != PERCENT_PERCENT }
            .reduce(0) { |a, e| a + (e[2] == SPLAT ? 2 : 1) }
        end

        def format?(node)
          format_method?(:format, node)
        end

        def sprintf?(node)
          format_method?(:sprintf, node)
        end

        def percent?(node)
          receiver_node, method_name, *arg_nodes = *node

          percent = method_name == :% &&
                    (STRING_TYPES.include?(receiver_node.type) ||
                     arg_nodes[0].array_type?)

          if percent && STRING_TYPES.include?(receiver_node.type)
            return false if heredoc?(node)
          end

          percent
        end

        def message(node)
          _receiver, method_name, *_args = *node
          num_args_for_format, num_expected_fields = count_matches(node)

          method_name = 'String#%' if PERCENT == method_name.to_s
          format(MSG, num_args_for_format, method_name, num_expected_fields)
        end
      end
    end
  end
end
