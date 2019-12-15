require 'plane'

class Airport
    attr_reader :capacity

    DEFAULT_CAPACITY = 20

    def initialize(capacity=DEFAULT_CAPACITY)
        @capacity = capacity
        @planes = []
    end

    def land(plane)
        raise "Airport is full" if full?
        @planes << plane
    end

    def take_off(plane)
        @planes.pop
    end

    def full?
        @planes.count >= @capacity
    end
end