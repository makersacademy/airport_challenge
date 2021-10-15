require_relative 'plane'

class Airport 

    def initialize
        @plane = []
        @capacity = 10 

    end 

    # def get_plane(plane)
    #     @plane << plane 
    # end 

    def land(plane)
        fail 'Airport is full' if full_airport
        @plane << plane 
    end 

    def take_off(plane)
        @plane.pop 
    end 

    def plane_gone
        @plane.empty? 
    end 

    def full_airport
        @plane.count >= @capacity
    end 


end 