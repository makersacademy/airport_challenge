class Plane
    attr_accessor :departed

    def initialize
        #by default it is created on the ground (land)
        @departed = false 
    end
    
    def land
        # if @can_land
        if @departed
            @departed = false
            true
        else
            false
        end     
    end

    def takeoff
        if @departed == false
            @departed = true
            true
        else
            false
        end
    end
end