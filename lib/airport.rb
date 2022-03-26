class Airport
  attr_reader :plane
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @plane = []
    @capacity = capacity
  end

  def land(plane)
    @plane << plane
  end
  
  def takeoff(plane)
    @plane.delete(plane)
    return plane
  end
  
end
