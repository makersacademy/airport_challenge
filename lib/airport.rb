require_relative "plane"
class Airport
    attr_accessor :capacity, :weather, :airport_name, :hanger
    DEFAULT_CAPACITY = 3

    def initialize
        @capacity = DEFAULT_CAPACITY
        @hanger = []
        @weather
        weather_generator()
    end 

    def taxi(plane)
        raise "No space for new aircraft" if @capacity == 0
        raise "Conditions are unfavourable" if @weather == :stormy
        @capacity -= 1
        return @hanger << plane.land
    end

    def depart(plane)
        raise "There are no planes to takeoff" if @hanger.include?(plane) == false
        raise "Conditions are unfavourable" if @weather == :stormy
        # Removes specific plane from hanger
        @capacity += 1
        @hanger.delete_at(hanger.index(plane.takeoff))
        return @hanger
    end

    private
    def weather_generator
        god_mode = rand(3)
        case god_mode
            when 0
                @weather = :sunny
            when 1
                @weather = :cloudy
            when 2
                @weather = :stormy
        end
    end
end
