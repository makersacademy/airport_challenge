class Plane
  attr_reader :flying
  def initialize
    @flying = true
  end

  def land(airport)
    fail "airport is full" if airport.full?
    fail "weather is stormy" if airport.stormy?    
    fail "plane has already landed" if flying? == false
  
    airport.planes.push(self)
    @flying = false
    return "plane has landed"
  end

  def depart(airport)
    fail "weather is stormy" if airport.stormy?
    fail "plane is not at that airport" if airport.planes.include?(self) == false
    fail "plane is already flying" if flying? 

    airport.planes.delete(self)
    @flying = true
    "plane has departed"
  end

  def flying?
    @flying
  end
end
