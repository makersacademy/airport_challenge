class Airport
    attr_reader :plane
    attr_reader :capacity
   
def intialize(capacity = 20)
    @capacity = capacity
    @plane = 0
    end 

def land(plane)
    fail "Cannot land plane: airport is full" if @plane
    @plane = plane
    end 

def take_off(plane)
    end 

end 