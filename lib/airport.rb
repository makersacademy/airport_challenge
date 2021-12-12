require_relative 'plane'

class Airport
    #attr_reader :bike

    def land(plane)
        @plane = plane
    end 

    def plane
        @plane
    end

    def take_off
        Plane.new
    end
end