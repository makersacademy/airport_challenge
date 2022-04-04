require 'weather'

class Airport
    DEFAULT_CAPACITY = 3

    def initialize(weather: Weather.new)
        @planehangar = []
        @weather = weather 
    end 

    def land(plane)
        fail 'Airport Full' if full?
        fail 'Cannot land due to bad weather' if weather.stormy?
        @planehangar << plane
    end 

    def takeoff(plane)
        fail 'No planes for takeoff' if empty?
        fail 'Cannot takeoff due to bad weather' if weather.stormy?
        @planehangar.pop
    end 

    private 

    def full?
        @planehangar.count >= DEFAULT_CAPACITY
    end 

    def empty?
        @planehangar.empty?
    end 

end 