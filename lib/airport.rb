class Airport
    def initialize
        @plane_array = []
    end

    def land(plane)
        @plane = plane
        @plane_array.push(plane)
        return @plane
    end
end
