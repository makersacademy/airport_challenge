require_relative 'plane'
require_relative 'weather_station'

class Airport
    attr_reader :hangar, :capacity, :weather
    DEFAULT_CAPACITY = 1

    def initialize(capacity = DEFAULT_CAPACITY, weather_station: WeatherStation.new)
        @capacity = capacity
        @hangar = []
        @weather_station = weather_station 
    end

    def status(plane)
        p "#{plane} is in the hangar" if hangar.include?(plane)
        p "#{plane} is in the sky" unless hangar.include?(plane)
    end

    def check_weather
        @weather = @weather_station.conditions_report
    end

    def take_off(plane)
        check_weather
        raise 'WARNING - Weather is stormy' if 
        # clear_to_launch?(plane)
        @hangar.delete(plane)
        plane.fly 
        "#{plane} has left the airport"
    end
    # def clear_to_launch?(plane)
    #     fail 'ERROR - Plane not in hangar' unless @hangar.include?(plane)
    #     fail 'WARNING - Weather is stormy' if conditions_safe == false
    # end 

    def land(plane)
        # clear_to_land?(plane)
        @hangar << plane
    end

    def clear_to_land?(plane)
        fail 'ERROR - Plane is already grounded' if hangar.include?(plane) 
        fail 'WARNING - Hanger is at capacity' if hangar.full?
        fail 'WARNING - Weather is stormy' unless conditions_safe == true
    end



    private 

    def weather
        Weather.new
    end 

    def full?
        hangar.length >= capacity 
    end

end 