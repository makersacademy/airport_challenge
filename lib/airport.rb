require_relative 'plane'

class Airport 

    def initialize
        @plane = []

    end 

    def get_plane(plane)
        @plane << plane 
    end 

    def land
        fail if 'Airport is full' if @plane 
        @plane.pop
    end 

    def take_off(plane)
        @plane.pop 
    end 

    def plane_gone
        @plane.empty? 
    end 

    def full_airport
        
    end 


end 