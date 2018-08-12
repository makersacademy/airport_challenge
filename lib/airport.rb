require_relative 'plane'
require_relative 'weather'

class Airport

    attr_reader :hangar, :capacity, :conditions_safe
    
    def initialize(capacity = 20)
        @capacity = capacity
        @hangar = []
        # @weather = weather 
    end

    def land(plane)
        # clear_to_land?(plane)
        @hangar << plane
    end

    def clear_to_land?(plane)
        fail 'ERROR - Plane is already grounded' if hangar.include?(plane) 
        fail 'WARNING - Hanger is at capacity' if hangar.full?
        fail 'WARNING - Weather is stormy' unless weather.conditions_safe == true
    end

    def take_off(plane)
        clear_to_launch?(plane)
        @hangar.delete(plane)
        plane.fly 
        "#{plane} has left the airport"
    end

    def clear_to_launch?(plane)
        fail 'ERROR - Plane not in hangar' unless @hangar.include?(plane)
        fail 'WARNING - Weather is stormy' unless weather.conditions_safe == true
    end 


    private 

    def weather
        Weather.new
    end 

    def full?
        hangar.length >= capacity 
    end

end 