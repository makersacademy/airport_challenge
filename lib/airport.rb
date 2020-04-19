class Airport

    def initialize(capacity)
        @capacity = capacity 
        @planes = 0
    end 

    def land(plane)
        raise 'Cannot land plane: airport full' if @planes.length >= @capacity
        @planes  +=1
    end 

    def take_off(plane)
    end 
end 

