require './lib/plane'

class Airport
AIRPORT_MAX_CAP = 10
    
    def initialize(capacity = AIRPORT_MAX_CAP)
        @planes_in_airport = []
        @capacity = capacity
    end

    def land(plane)
        raise "Airport full" if full?
        @planes_in_airport << plane
        "Plane landed"
    end

    def take_off
        @planes_in_airport.pop
        "Plane no longer in the airport"
    end

    def full?
        @planes_in_airport.size >= AIRPORT_MAX_CAP
    end


end

