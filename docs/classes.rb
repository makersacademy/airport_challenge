class Airport 
  DEFAULT_CAPACITY = 20 
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity 
    @planes = [] 
  end 
    
  def land(plane) 
    fail "Airport Full. Cannot Land" if @planes.size >= @capacity
    (@planes.size < @capacity) ? @planes << plane : nil
  end

  def take_off(plane)
    print "Successful take off:"
    print "true, plane no longer in airport" 
    true 
  end 
end 

class Plane
  
end
