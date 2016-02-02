require_relative 'plane'

  class Airport
    attr_reader :planes

      def initialize
        @planes = []
        @capacity = set_capacity
      end

      DEFAULT_CAPACITY = 20

      def set_capacity(capacity = DEFAULT_CAPACITY)
        capacity
      end

        def land(plane)
          raise "The airport is at maximum capacity." if full?
          @planes << plane
        end

        def take_off
          raise "There is no plane scheduled to take off" if empty?
        end

      private
        def empty?
          @planes.length == 0
        end

        def full?
          @planes.length >= set_capacity
        end

  end
