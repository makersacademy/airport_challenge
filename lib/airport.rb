require_relative 'plane'
require_relative 'weather_station'

class Airport
    attr_reader :hangar, :capacity, :weather, :safe, :weather_station
    
    DEFAULT_CAPACITY = 1

    def initialize(weather_station = WeatherStation.new, capacity = DEFAULT_CAPACITY)
        @capacity = capacity
        @hangar = []
        @weather_station = weather_station 
    end

    def status(plane)
       hangar.include?(plane) ? "#{plane} is in the hangar" : "#{plane} is in the sky" 
    end

    def check_weather
        @safe = weather_station.conditions_safe?
    end

    def take_off(plane)
        clear_to_launch?(plane)
        plane.fly
        hangar.delete(plane)
        "#{plane} has left the airport"
    end

    def clear_to_launch?(plane)
        fail 'ERROR - Plane not in hangar' unless hangar.include?(plane)
        check_weather
        fail 'DANGER - Weather is stormy' if safe == false
    end 

    def land(plane)
        clear_to_land?(plane)
        plane.touch_down
        hangar << plane
        "#{plane} is in the hangar"
    end

    def clear_to_land?(plane)
        fail 'ERROR - Plane already grounded' if hangar.include?(plane) 
        fail 'WARNING - Hanger is at capacity' if full?
        check_weather
        fail 'DANGER - Weather is stormy' unless safe == true
    end


    # private 

    def full?
        hangar.length >= @capacity 
    end

end 