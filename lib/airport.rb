require "./lib/plane.rb"

class Airport

    RUNWAY_CAPACITY = 5

    attr_reader :planes, :capacity

    def initialize(capacity=RUNWAY_CAPACITY)
        @planes = []
        @capacity = capacity
    end

    def land(plane)
        raise "The airport is full" if full?
        @planes << plane
    end

    def take_off(plane)
        @planes.delete(plane)
    end

    private

    def full?
        planes.count >= capacity
    end

end

