class Airport

    attr_reader :plane_array
    
    def initialize
        @plane_array = []
    end

    def land(plane)
        @plane = plane
        @plane_array << plane
    end

    def takeoff(plane)
        plane
      end
end
