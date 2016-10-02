require_relative 'plane'

class Airport

def initialize 
   @planes = [] 
end

def flight_checker(plane)
    @planes.include?(plane)
end
    
def land(plane)
     @planes.push(plane)
end

def depart(plane)
    @planes.delete(plane)
end

end