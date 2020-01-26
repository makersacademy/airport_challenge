require_relative 'plane'

class Airport
     
    def initialize(count = 5)
        @hanger = []
        @count = count
    end

    def land(plane)
        fail "Airport Full" if hanger_full?
        @hanger << plane.land
    end

    def take_off(plane)
        plane.take_off
        @hanger = nil
    end

    def hanger_full?
        @hanger.count >= @count
    end

end