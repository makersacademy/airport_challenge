require 'weather'
require 'plane'
class Airport
    private
    attr_reader :weather
    public
    attr_accessor :planes
    attr_accessor :capacity
    include Weather
    DEFAULT_CAPACITY = 10
    def initialize(capacity = DEFAULT_CAPACITY)
        @planes = []
        @capacity = capacity
    end

    def land(plane)
        fail 'Airport is full,cannot land' if full?
        fail 'Weather is stormy,cannot land' if stormy? 
        plane.land
        planes << plane

    end

    def take_off(plane)
        fail 'Weather is stormy,cannot takeoff' if stormy?
        plane.take_off
        planes.delete(plane)
    end

    def full?
        planes.count >= capacity
    end
    

end
