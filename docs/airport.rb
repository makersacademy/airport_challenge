

class Airport 

    attr_accessor :planes

    def initialize
        @planes = []
    end

    def instruct_plane_to_land(plane)
        @planes << plane
    end 
end 

