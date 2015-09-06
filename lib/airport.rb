class Airport

  attr_reader :planes
  attr_reader :capacity

  def initialize (capacity = 10)
    @planes = []
    @capacity = capacity
  end

  def plane_take_off
    planes[0].take_off
    planes.shift
  end

  def plane_landing (plane)
    plane.land
    planes << plane
  end

  def traffic_control
    fail "The airport is full" if planes.count >= capacity
  end

end
