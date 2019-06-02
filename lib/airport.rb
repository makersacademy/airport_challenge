require_relative "plane"
class Airport
    attr_accessor :capacity, :weather, :airport_name, :hanger

    def initialize(name)
        @airport_name = name
        @capacity = 3
        @hanger = []
        @weather
        weather_generator()
    end 

    def taxi(plane)
        if @capacity == 0
            raise "No space for new aircraft"
        elsif @weather == "STORMY"
            raise "Conditions are unfavourable"
        else
            @capacity -= 1
            return @hanger << plane.land
        end
    end

    def depart(plane)
        if @hanger.include?(plane) == false
            raise "There are no planes to takeoff"
        elsif @weather == "STORMY"
            raise "Conditions are unfavourable"
        else
            # Removes specific plane from hanger
            @capacity += 1
            @hanger.delete_at(hanger.index(plane.takeoff))
            return @hanger
        end
    end

    private
    def weather_generator
        god_mode = rand(3)
        case god_mode
            when 0
                @weather = "SUNNY"
            when 1
                @weather = "CLOUDY"
            when 2
                @weather = "STORMY"
        end
    end
end
