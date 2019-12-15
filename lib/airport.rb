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
        raise "Cannot take off due to stormy weather" if weather == 1
        @planes.pop
    end

    def full?
        @planes.count >= @capacity
    end

    def weather
        num = rand(1..5)
        return "stormy" if num == 1
        return "sunny"
    end
end