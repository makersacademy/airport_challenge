class Airport
  CAPACITY = 10
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise "Airport is full." if self.full?
    @planes.push(plane)
  end

  def takeoff(plane)
    @planes.delete(plane)
  end

  def full?
    @planes.length == CAPACITY
  end
end
