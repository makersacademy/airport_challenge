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

        fail "This plane is already in a hangar!" if airplane.landed?

        @hangar << airplane
        @hangar.last
    end

    def takeoff(plane)
        fail "Can't take off, weather is stormy!" if Weather.stormy?

        @hangar.delete(plane)
        plane
    end
end
