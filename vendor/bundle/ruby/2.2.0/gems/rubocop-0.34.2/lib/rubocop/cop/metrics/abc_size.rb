# encoding: utf-8

module RuboCop
  module Cop
    module Metrics
      # This cop checks that the ABC size of methods is not higher than the
      # configured maximum. The ABC size is based on assignments, branches
      # (method calls), and conditions. See http://c2.com/cgi/wiki?AbcMetric
      class AbcSize < Cop
        include MethodComplexity

        MSG = 'Assignment Branch Condition size for %s is too high. [%.4g/%.4g]'
        BRANCH_NODES = [:send].freeze
        CONDITION_NODES = CyclomaticComplexity::COUNTED_NODES.freeze

        private

        def complexity(node)
          assignment = 0
          branch = 0
          condition = 0

          node.each_node do |child|
            if ASGN_NODES.include?(child.type)
              assignment += 1
            elsif BRANCH_NODES.include?(child.type)
              branch += 1
            elsif CONDITION_NODES.include?(child.type)
              condition += 1
            end
          end

          Math.sqrt(assignment**2 + branch**2 + condition**2).round(2)
        end
      end
    end
  end
end
