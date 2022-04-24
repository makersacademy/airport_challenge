class Airport
  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Airport is full, cannot land plane' if capacity_full?
    @planes << (plane)
  end

  
  def takeoff(plane)
    
  end

  def capacity_full?
    max_capacity = 10
    @planes.size >= max_capacity
  end

end

class Plane
  def at_airport?
    false
  end
end
