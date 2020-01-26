require_relative 'plane'
class Airport
    DEFAULT_CAPACITY = 20
    attr_accessor :hangar, :capacity
    def initialize(capacity = DEFAULT_CAPACITY)
        @capacity = capacity
        @hangar = []
    end

    def land(airplane)
        fail "Can't land, weather is stormy!" if Weather.stormy?


        fail "Hangar is full!" unless @hangar.count < @capacity

        @hangar << airplane
        return @hangar.last
    end

    def takeoff(plane)
        fail "Can't take off, weather is stormy!" if Weather.stormy?
        @hangar.delete(plane)
        plane
    end
end
