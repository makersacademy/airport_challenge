require "./lib/plane.rb"
require "./lib/weather.rb"

class Airport

    RUNWAY_CAPACITY = 5

    attr_reader :planes, :capacity

    def initialize(capacity=RUNWAY_CAPACITY)
        @planes = []
        @capacity = capacity
        @weather = Weather.new
    end

    def land(plane)
        raise "The airport is full" if full?
        raise "The weather is too stormy" if stormy?
        @planes << plane
    end

    def take_off(plane)
        raise "The weather is too stormy" if stormy?
        @planes.delete(plane)
    end

    private

    def full?
        planes.count >= capacity
    end

    def stormy?
        @weather.current_conditions
        @weather.conditions == "stormy" ? true : false
    end

end

