# encoding: utf-8

module RuboCop
  module Cop
    module Style
      # Check for uses of braces or do/end around single line or
      # multi-line blocks.
      class BlockDelimiters < Cop
        include ConfigurableEnforcedStyle
        include AutocorrectUnlessChangingAST

        def on_send(node)
          _receiver, method_name, *args = *node
          return unless args.any?

          block = get_block(args.last)
          return unless block && !parentheses?(node) && !operator?(method_name)

          # If there are no parentheses around the arguments, then braces and
          # do-end have different meaning due to how they bind, so we allow
          # either.
          ignore_node(block)
        end

        def on_block(node)
          return if ignored_node?(node)

          if proper_block_style?(node)
            correct_style_detected
          else
            add_offense(node, :begin) { opposite_style_detected }
          end
        end

        private

        def message(node)
          block_begin = node.loc.begin.source
          block_length = Util.block_length(node)

          case style
          when :line_count_based
            if block_length > 0
              'Avoid using `{...}` for multi-line blocks.'
            else
              'Prefer `{...}` over `do...end` for single-line blocks.'
            end
          when :semantic
            if block_begin == '{'
              'Prefer `do...end` over `{...}` for procedural blocks.'
            else
              'Prefer `{...}` over `do...end` for functional blocks.'
            end
          end
        end

        def correction(node)
          lambda do |corrector|
            b = node.loc.begin
            e = node.loc.end
            if b.is?('{')
              corrector.insert_before(b, ' ') unless whitespace_before?(b)
              corrector.insert_before(e, ' ') unless whitespace_before?(e)
              corrector.replace(b, 'do')
              corrector.replace(e, 'end')
            else
              corrector.replace(b, '{')
              corrector.replace(e, '}')
            end
          end
        end

        def whitespace_before?(node)
          node.source_buffer.source[node.begin_pos - 1, 1] =~ /\s/
        end

        def get_block(node)
          case node.type
          when :block
            node
          when :send
            receiver, _method_name, *_args = *node
            get_block(receiver) if receiver
          end
        end

        def proper_block_style?(node)
          case style
          when :line_count_based
            line_count_based_block_style?(node)
          when :semantic
            semantic_block_style?(node)
          end
        end

        def line_count_based_block_style?(node)
          block_length = Util.block_length(node)
          block_begin = node.loc.begin.source

          if block_length > 0
            block_begin != '{'
          else
            block_begin == '{'
          end
        end

        def semantic_block_style?(node)
          method_name = extract_method_name_from_block(node)
          return true if ignored_method?(method_name)

          block_begin = node.loc.begin.source

          if block_begin == '{'
            functional_method?(method_name) || functional_block?(node)
          else
            procedural_method?(method_name) || !return_value_used?(node)
          end
        end

        def extract_method_name_from_block(block)
          node, _args, _body = *block
          _receiver, method_name, *_args = *node

          method_name
        end

        def ignored_method?(method_name)
          ignored_methods.include?(method_name)
        end

        def functional_method?(method_name)
          functional_methods.include?(method_name)
        end

        def functional_block?(node)
          return_value_used?(node) || return_value_of_scope?(node)
        end

        def procedural_method?(method_name)
          procedural_methods.include?(method_name)
        end

        def return_value_used?(node)
          return unless node.parent

          # If there are parentheses around the block, check if that
          # is being used.
          if node.parent.begin_type?
            return_value_used?(node.parent)
          else
            Util::ASGN_NODES.include?(node.parent.type) ||
              node.parent.send_type?
          end
        end

        def return_value_of_scope?(node)
          return unless node.parent

          conditional?(node.parent) || array_or_range?(node.parent) ||
            node.parent.children.last == node
        end

        def procedural_methods
          cop_config['ProceduralMethods'].map(&:to_sym)
        end

        def functional_methods
          cop_config['FunctionalMethods'].map(&:to_sym)
        end

        def ignored_methods
          cop_config['IgnoredMethods'].map(&:to_sym)
        end

        def conditional?(node)
          node.if_type? || node.or_type? || node.and_type?
        end

        def array_or_range?(node)
          node.array_type? || node.irange_type? || node.erange_type?
        end
      end
    end
  end
end
