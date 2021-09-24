require_relative 'plane.rb'

class Airport
    def initialize
        @my_airport = []
    end

    def land_plane
        # Should add plain to my_airport[]
        @plane = Plane.new
        @my_airport.push(@plane)
        puts "The plane is in the airport" + @my_airport.to_s
        return @my_airport
    end

    def take_off
        # Should remove the plane from my_airport[]
        @my_airport.shift
        puts "The plane has taken off and left the airport" + @my_airport.to_s
    end

    def search_for_plane
        # Should check if the plane is in my_airport[]
        if @my_airport.include?(@plane)
            p "This plane is in the Airport"
        else
            p "This plane has left the Airport"
        end
    end
    
end