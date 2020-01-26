require_relative 'plane'
require_relative 'weather'
class Airport
    attr_accessor :airport_capacity
    
    def initialize(capacity = 10, weather = Weather.new)
        @plane_storage = []
        @airport_capacity = capacity
        @weather = weather
    end 

    def land(plane)
        fail 'no space available' if full?
        @plane_storage << plane
    end 

    def plane_count 
        @plane_storage.count
    end 

    def take_off
        fail 'too stormy to takeoff' if @weather.stormy?
        @plane_storage.drop(1)
    end 

    def full?
        @plane_storage.count >= @airport_capacity
    end

end 