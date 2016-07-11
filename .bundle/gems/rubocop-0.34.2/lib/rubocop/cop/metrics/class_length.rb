# encoding: utf-8

module RuboCop
  module Cop
    module Metrics
      # This cop checks if the length a class exceeds some maximum value.
      # Comment lines can optionally be ignored.
      # The maximum allowed length is configurable.
      class ClassLength < Cop
        include ClassishLength

        def on_class(node)
          check_code_length(node)
        end

        private

        def message(length, max_length)
          format('Class has too many lines. [%d/%d]', length, max_length)
        end
      end
    end
  end
end
