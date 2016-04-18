# encoding: utf-8

module RuboCop
  module Cop
    # Common functionality for checking minimum body length.
    module MinBodyLength
      def min_body_length?(node)
        (node.loc.end.line - node.loc.keyword.line) > min_body_length
      end

      def min_body_length
        length = cop_config['MinBodyLength'] || 1
        return length if length.is_a?(Integer) && length > 0

        fail 'MinBodyLength needs to be a positive integer!'
      end
    end
  end
end
