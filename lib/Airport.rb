require_relative 'plane'

class Airport
    attr_accessor :planes, :capacity
    DEFAULT_CAPACITY = 10
    def initialize(capacity = DEFAULT_CAPACITY)
        @planes = []
        @capacity = capacity
    end

    def land(plane)
        fail "Airport full: cannot land" if full?
        @planes.push plane
        plane.land
    end

    def take_off(plane)
        fail "Plane not in airport" unless in_airport?(plane)
        @planes.delete plane
        plane.take_off
    end

    def full?
        @planes.count >= @capacity  ? true : false
    end

    def in_airport?(plane)
        if @planes.include? (plane)
            true
        else 
            false
        end
    end
end