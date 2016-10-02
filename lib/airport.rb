require_relative 'plane'

class Airport

def initialize 
   @planes = [] 
end

def planes
    @planes
end
    
def land(plane)
     @planes.push(plane)
end

end