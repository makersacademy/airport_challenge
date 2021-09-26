require_relative 'plane'
require_relative 'weather'

class Airport
    DEFAULT_CAPACITY = 100

    attr_accessor :hangar, :capacity

    def initialize (capacity = DEFAULT_CAPACITY)
        @hangar =[]
        @capacity = capacity
        @weather = Weather.new
    end

    def land(plane)
        fail "Weather is bad, cannot land plane" if @weather.bad? 
        fail "Airport is full" if full
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

# airport = Airport.new
# plane = Plane.new
# weather = Weather.new
# @hangar =[]
# print airport.land(plane)
