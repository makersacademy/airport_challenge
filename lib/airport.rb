require_relative 'plane'
require_relative 'weather'

class Airport

    attr_reader :hangar, :conditions_safe
    
    def initialize 
        @hangar = []
    end

    def land(plane)
        @hangar << plane
    end

    def clear_to_land?(plane)
    end

    def take_off(plane)
        clear_to_launch?(plane)
        @hangar.delete(plane)
        plane.fly 
        "#{plane} has left the airport"
    end

    def clear_to_launch?(plane)
        fail 'ERROR - Plane not in hangar' unless @hangar.include?(plane)
        fail 'WARNING - Weather is stormy' unless conditions_safe == true
    end 


    private 

    def weather
        Weather.new
    end 

end 