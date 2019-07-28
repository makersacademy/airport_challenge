class Airport

DEFAULT_CAPACITY = 20
attr_reader :capacity, :landed_planes 

    def initialize(capacity = DEFAULT_CAPACITY)
        @capacity = capacity
        @landed_planes = []
    end

    def land_plane(plane)
        @landed_planes << plane 
    end
    
    def takeoff_plane
        @landed_planes.pop  
        @landed_planes
    end
end


