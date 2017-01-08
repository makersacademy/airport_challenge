class Airport
  DEFAULT_CAPACITY = 200
  attr_reader :planes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Bad weather conditions!" if stormy?
    fail "No landing slots available!" if full?
    @planes << plane
    @planes[0]
  end

  def take_off(plane)
    fail "Bad weather conditions!" if stormy?
    @planes.pop
  end

  private

  def full?
    @planes.count >= capacity
  end

  def stormy?
    true
  end

end
