require_relative 'plane'

class Airport 

    def initialize
        @plane = []
    end 

    def get_plane(plane)
        @plane << plane 
    end 


    def land
        @plane.pop
    end 


end 