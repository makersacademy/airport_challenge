class Airport
  attr_reader :plane

  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Airport is full, cannot land plane' if capacity_full?
    @planes << (plane)
  end
  
  def takeoff(plane)
    raise 'cannot take off, weather is stormy' if stormy?
  end

  def capacity_full?
    max_capacity = 10
    @planes.size >= max_capacity
  end

end
