=begin
require_relative 'plane'
require_relative 'weather'

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
        if plane.flying? && !self.stormy? && !self.full?
            plane.landed
            @planes << plane 
        else
            raise("A plane cannot be landed")
        end
    end

    def full?
    end

    def stormy?
        @weather == "stormy" ? true : false
    end
    
end
=end