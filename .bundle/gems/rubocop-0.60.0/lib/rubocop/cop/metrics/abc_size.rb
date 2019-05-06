# frozen_string_literal: true

module RuboCop
  module Cop
    module Metrics
      # This cop checks that the ABC size of methods is not higher than the
      # configured maximum. The ABC size is based on assignments, branches
      # (method calls), and conditions. See http://c2.com/cgi/wiki?AbcMetric
      class AbcSize < Cop
        include MethodComplexity

        MSG = 'Assignment Branch Condition size for %<method>s is too high. ' \
              '[%<complexity>.4g/%<max>.4g]'.freeze

        private

        def complexity(node)
          Utils::AbcSizeCalculator.calculate(node)
        end
      end
    end
  end
end
