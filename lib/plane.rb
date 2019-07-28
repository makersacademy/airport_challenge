class Plane
    attr_accessor :can_takeoff, :can_land

    def initialize
        #by default it is created on the ground (land)
        @can_takeoff = true 
        @can_land = false  
    end
    
    def land
        if @can_land
            @can_land = false
            @can_takeoff = true
            true
        else
            false
        end     
    end

    def takeoff
        if @can_takeoff
            @can_land = true
            @can_takeoff = false
            true
        else
            false
        end
    end
end