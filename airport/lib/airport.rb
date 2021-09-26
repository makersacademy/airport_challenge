require_relative 'plane'

class Airport
DEFAULT_CAPACITY = 20

    attr_reader :planes
    attr_accessor :weather

    def initialize(planes = [], full = DEFAULT_CAPACITY, weather = :sunny)
        @planes = planes
        @full = full
        @weather = weather
    end

    def land(plane)
        fail "Plane cannot land since airport is full" if full?
        @planes << plane
    end

    def take_off(plane)
        fail "Plane cannot take off in stormy weather" if stormy?
        @planes.delete(plane)
    end

    def full?
        @planes.length >= @full
    end

    def stormy?
        weather == :stormy
    end

end 



