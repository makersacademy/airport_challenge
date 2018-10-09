require_relative 'plane'
require_relative 'weather'

class AirportStation
    attr_reader :capacity
    
    def initialize(capacity)
        @airport = []
        @current_weather = weather.rand_weather
    end
    
    def land(plane)
        fail 'Airport is full' if full?
    end
    
    def takeoff
        true
    end
    
    def full?
        @airport.count >= capacity
    end
    
end