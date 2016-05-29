class Airport
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport is full!" if @planes.count >= capacity
    @planes << plane
    plane.land(self)
  end

  def take_off(plane)
    @planes.delete(plane)
    plane.take_off
  end
end
