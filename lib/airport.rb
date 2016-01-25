class Airport

  DEFAULT_CAPACITY = 20
  attr_accessor :capacity
  attr_reader :planes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def full
    return true if planes.count == capacity
    false
  end

  def dock(plane)
    planes.push(plane)
  end

  def undock(plane)
    planes.delete(plane)
  end

end