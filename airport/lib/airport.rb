require_relative 'plane'

class Airport
DEFAULT_CAPACITY = 20

    attr_reader :planes 

    def initialize(planes = [], full = DEFAULT_CAPACITY)
        @planes = planes
        @full = full
    end

    def land(plane)
        fail "Plane cannot land since airport is full" if full?
        @planes << plane
    end

    def take_off(plane)
        @planes.delete(plane)
    end

    def full?
        @planes.length >= @full
    end
end 



