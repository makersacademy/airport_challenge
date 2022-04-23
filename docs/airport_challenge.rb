class Airport
  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    max_capacity = 10
    raise 'Airport is full, cannot land plane' if @planes.size >= max_capacity
    @planes.push(plane)
  end

  def takeoff(plane)
  
  end
end

class Plane
  def at_airport?
    false
  end
end
