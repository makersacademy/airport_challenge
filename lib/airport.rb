require 'plane'
require 'weather'

class Airport
    DEFAULT_CAPACITY = 100

    attr_accessor :hangar, :capacity

    def initialize(capacity = DEFAULT_CAPACITY)
        @hangar =[]
        @capacity = capacity
    end

    def land(plane)
        raise "Airport is full" if full
        @hangar << plane.class.to_s #adds Plane into hangar, instead of object id
    end

    def take_off
        @hangar.pop
    end

    private

    def full
        @hangar.length >= capacity
    end



end