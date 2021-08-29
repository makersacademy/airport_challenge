class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport is full" if @planes.size >= @capacity

    @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
  end

end
