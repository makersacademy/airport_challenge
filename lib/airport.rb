class Airport
    def max_capacity
    end 

    def initialize 
        @planehangar = []
    end 

    def land(plane)
        fail 'Airport Full' if @planehangar.count >= 3
        @planehangar << plane
    end 

    def takeoff(plane)
        fail 'No planes for takeoff' if @planehangar.empty?
        @planehangar.pop
    end 

end 