class Airport
    attr_reader :planes
    attr_reader :capacity
   
def intialize(capacity)
    @capacity = capacity
    @planes = []
    end 
def land(plane)
    fail 'Unable to land, airport capacity full' if @planes.size == @capacity
   

end 

def take_off
    end 

end 