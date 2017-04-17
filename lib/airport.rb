class Airport

  attr_reader :planes
  DEFAULT_CAPACITY = 100

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail 'airport is full' if full?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    plane.take_off
    @planes.delete(plane)
  end

  def full?
    @planes.length >= @capacity
  end

end
