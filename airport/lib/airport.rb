require_relative 'plane'

class Airport

    attr_reader :planes 

    def initialize(planes = [])
        @planes = planes
    end

    def land(plane)
        fail "Plane cannot land since airport is full" if full?
        @planes << plane
    end

    def take_off(plane)
        @planes.delete(plane)
    end

    def full?
        @planes.length == 5
    end
end 



