class Airport
    
    attr_accessor :plane_list
    
    def initialize
        @plane_list = []
    end

    def land_plane(plane)
        @plane_list.push(plane)
    end

    def take_off(plane)
        @plane_list.pop
    end
end

class Plane
    attr_reader :plane
end