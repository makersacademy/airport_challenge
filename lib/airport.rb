require_relative 'plane'

class Airport
    attr_reader :capacity, :weather

    DEFAULT_CAPACITY = 100
    WEATHER_CONDITIONS = ["Sunny", "Stormy"]

    def initialize(capacity=DEFAULT_CAPACITY)
        @capacity = capacity
        @weather = WEATHER_CONDITIONS.sample
    end

    def full?
    end

    def stormy?
    end

end