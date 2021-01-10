require_relative 'plane'

class Airport
    
    attr_reader :plane

    def takenoff?
        Plane.new
    end

    def land (plane)
        @plane = plane
    end

end
