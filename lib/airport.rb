class Airport
  CAPACITY = 1
  
  def initialize
    @planes = []
  end

  def land(plane)
    fail "The airport is full" if @planes.count >= CAPACITY
    @planes = plane
  end

  def take_off(plane)
    "The plane has taken off"
  end
end

class Plane
end
