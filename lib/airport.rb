class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport full" if full?
    @planes.push(plane)
  end

  def take_off(plane)
    @planes.pop
  end

  def full?
    @planes.length >= @capacity
  end
end
