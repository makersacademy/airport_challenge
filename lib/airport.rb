require 'weather'
class Airport
    attr_reader :weather
    attr_reader :hangar

    # Creates an instance of Aiport with default capacity of 20
    def initialize(capacity = 20, storm_chance = 0.1)
        @hangar = []
        @capacity = capacity
        @weather = Weather.new(storm_chance)
    end

    # Gets airport capacity
    def get_capacity
        return @capacity
    end

    # Instruct plane to land
    def land_plane(plane)
        # Checks if weather is stormy
        stormy = @weather.check_for_storm
        if stormy
            # if weather is stormy plane cannot land
            return "Landing request rejected due to ongoing storm."
        elsif hangar_full?
            # if hangar is full plane cannot land
            return "Landing request rejected due to hangar being full."
        else
            # if weather is calm and hangar isn't full then land the plane
            @hangar << plane
            return "Plane: #{plane.get_id}, has landed."
        end
    end

    # Instruct plane to take-off
    def take_off_plane(plane)
        stormy = @weather.check_for_storm
        if !@hangar.include?(plane)
            # if plane is not in hangar then it cannot take off
            return "This plane is not in the hangar."
        elsif stormy
            # if weather is stormy then plane cannot take off
            return "Take-off request rejected due to ongoing storm."
        else
            # if weather is calm and plane is in hangar then take off and return take off confirmation
            @hangar.delete(plane)
            return "Plane: #{plane.get_id}, has taken off."
        end
    end

    private
        # Checks if hangar is full
        def hangar_full?
            if @hangar.length == @capacity
                return true
            else
                return false
            end
        end

end
