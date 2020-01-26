require_relative 'plane'
require_relative 'weather'

class Airport
    attr_accessor :planes, :capacity, :weather
    DEFAULT_CAPACITY = 10
    def initialize(capacity = DEFAULT_CAPACITY)
        @planes = []
        @capacity = capacity
        @weather = Weather.new
    end

    def land(plane)
        fail "Airport full: cannot land" if full?
        fail "Too stormy for landing" if @weather.stormy?
        @planes.push plane
        plane.land
    end

    def take_off(plane)
        fail "Plane not in airport" unless in_airport?(plane)
        fail "Too stormy for take-off" if @weather.stormy?
        @planes.delete plane
        plane.take_off
    end

    def full?
        @planes.count >= @capacity  ? true : false
    end

    def in_airport?(plane)
        if @planes.include? (plane)
            true
        else 
            false
        end
    end
end