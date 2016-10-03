require_relative 'plane'

class Airport
    
attr_accessor :capacity
DEFAULT_CAPACITY = 15

def initialize(capacity = DEFAULT_CAPACITY)
   @planes = [] 
   @capacity = capacity
end

def flight_checker(plane)
    @planes.include?(plane)
end
    
def land(plane)
     fail 'Airport full' if full?
     @planes.push(plane)
end

def depart(plane)
    @planes.delete(plane)
end

private

def full?
    @planes.count >= @capacity
end

end