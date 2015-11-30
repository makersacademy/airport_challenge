class Airport

  attr_reader :planes

  def initialize
    @planes = []
    @capacity = 100
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
