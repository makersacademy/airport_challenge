class Airport
    DEFAULT_CAPACITY = 3

    def initialize 
        @planehangar = []
    end 

    def land(plane)
        fail 'Airport Full' if full?
        @planehangar << plane
    end 

    def takeoff(plane)
        fail 'No planes for takeoff' if empty?
        @planehangar.pop
    end 

    private 

    def full?
        @planehangar.count >= DEFAULT_CAPACITY
    end 

    def empty?
        @planehangar.empty?
    end 

end 