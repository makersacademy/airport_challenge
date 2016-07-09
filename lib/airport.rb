class Airport
DEFAULT_CAPACITY = 3

  attr_reader :planes
  attr_reader :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail 'Airport Full' if planes.length >= capacity
    plane.land
    @planes << plane
  end

  def take_off(plane)
    plane.take_off
    @planes.pop
  end
end
