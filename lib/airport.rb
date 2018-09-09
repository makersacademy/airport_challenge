class Airport
    DEFAULT_CAPACITY = 5

    attr_accessor :plane_list
    attr_accessor :weather
    attr_accessor :capacity
    
    def initialize(weather = "sunny", capacity = DEFAULT_CAPACITY)
        @plane_list = []
        @weather = weather
        @capacity = capacity
    end

    def land_plane(plane)
        fail "Weather is too harsh for planes to land" unless @weather == "sunny"
        fail "Airport capacity at max, can not land plane" unless plane_list.count < capacity
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