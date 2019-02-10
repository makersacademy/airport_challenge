
class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :airport
  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def accept(plane)
    plane.land(self)
    @planes << plane
  end

  def release(plane)
    plane.takeoff(self)
    @planes.delete(plane)
  end

  def full
    @planes.count >= @capacity
  end

  def contains(plane)
    @planes.include?(plane)
  end

end
