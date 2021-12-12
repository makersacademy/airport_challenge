class Airport
    def max_capacity
    end 

    def land(plane)
        fail 'Airport Full' if @plane
        @plane = plane
    end 

    def takeoff(plane)
        fail 'No planes for takeoff' unless @plane
        @plane
    end 

end 