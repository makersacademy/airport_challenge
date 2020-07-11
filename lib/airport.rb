require_relative 'plane'

class Airport
    attr_reader :capacity, :weather

    DEFAULT_CAPACITY = 100
    WEATHER_CONDITIONS = ["sunny", "stormy"]

    def initialize(capacity=DEFAULT_CAPACITY)
        @capacity = capacity
        @weather = WEATHER_CONDITIONS.sample
        @planes = []
    end

    def land(plane)
        plane.flying? && !self.stormy? && !self.full? ? @planes << plane : raise("A plane cannot be landed")
    end

    def full?
    end

    def stormy?
        @weather == "stormy" ? true : false
    end
    
end