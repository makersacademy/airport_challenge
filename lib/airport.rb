

class Airport
  attr_accessor :planes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 1
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "The airport is full" if full?
    plane.status = self
    @planes << plane
  end

  def take_off(plane)
    fail "This plane is not in this airport" if plane.status != self
    plane.status = 'air'
    @planes.delete(plane)
  end

  private

  def full?
    @planes.length == @capacity
  end

end
