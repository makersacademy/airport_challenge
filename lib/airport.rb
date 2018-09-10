require_relative './plane.rb'

class Airport
    DEFAULT_CAPACITY = 5

    attr_accessor :plane_list
    attr_accessor :weather
    attr_accessor :capacity
    
    def initialize(capacity = DEFAULT_CAPACITY)
        @plane_list = []
        @capacity = capacity
    end

    def land_plane(plane)
        fail "Weather is too harsh for planes to land" if stormy == true
        fail "Airport capacity at max, can not land plane" unless plane_list.count < capacity
        @plane_list.push(plane)
    end

    def take_off(plane)
        fail "Weather is too harsh for planes to take off" if stormy == true
        @plane_list.delete(plane)
    end
    def stormy
        # old code
        # gen = rand(0..1)
        # if gen == 0
        #     @weather = "sunny"
        # else
        #     @weather = "stormy"
        # end

        # code review - suggested code from partner:
        rand(1..100) > 80 

        # rand 1 to 100, set probability of returning true 80% of time - 20% return false
    end
end

