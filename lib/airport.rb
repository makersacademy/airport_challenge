class Airport
    attr_accessor :plane_list
    # attr_accessor :weather
    
    def initialize(weather = "sunny")
        @plane_list = []
        @weather = weather
        p @weather
    end

    def land_plane(plane)
        @plane_list.push(plane)
    end

    def take_off(plane)
        fail "Weather is too harsh for planes to take off" unless @weather == "sunny"
        @plane_list.delete(plane)
    end
end

class Plane
    attr_reader :plane
end