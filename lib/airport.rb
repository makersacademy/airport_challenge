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
     fail 'The airport is currently full.' if full?
     fail 'Plane is unable to land due to adverse weather conditions.' if storm_weather?
     @planes.push(plane)
end

def depart(plane)
    @planes.delete(plane)
end

private

def full?
    @planes.count >= @capacity
end

def storm_weather?
    return true if rand(0..200) == 1 
end
end