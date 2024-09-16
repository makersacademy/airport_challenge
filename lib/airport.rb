require "plane"
require "weather"

class Airport
    attr_reader :plane
    attr_reader :weather
    attr_reader :capacity
    attr_reader :landed_planes
    DEFAULT_CAPACITY = 20

    def initialize(plane, weather, capacity = DEFAULT_CAPACITY)
        @plane = plane
        @weather = weather
        @landed_planes = []
        @capacity = capacity
    end
    
    def plane_land(plane)
        if !plane_can_fly?
            raise "Weather warning, cannot land plane"
        elsif full?
            raise "The airport is full"
        else
            @landed_planes.push(plane)
        end
    end

    def plane_takeoff
        if !plane_can_fly?
            raise "Weather warning, plane cannot take off"
        elsif !empty? 
            rand_index = rand(0..@landed_planes.length)
            @landed_planes.delete_at(rand_index)
            puts "The plane has taken off"
        else
            raise "No planes in the airport"
        end
    end

    def get_landed_planes
        return @landed_planes
    end


    private

    def plane_can_fly?
        if @weather.instance_variable_get(:@weather) == "calm"
            return true
        else
            return false
        end
    end

    def empty?
        if @landed_planes.length == 0
            return true
        else
            return false
        end
    end

    def full?
        if @landed_planes.length + 1 > @capacity
            return true
        else
            return false
        end
    end  
end