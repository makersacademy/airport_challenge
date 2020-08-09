class Airport
    attr_reader :planes_landed
    attr_reader :capacity
   
def intialize(capacity = 20)
    @capacity = capacity
    @planes_landed = 0
    end 

def land(plane)
    fail "Cannot land plane: airport is full" if full? @planes_landed > @capacity
    @planes_landed += 1
    end 

def take_off(plane)
    end 

end 