class Airport
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "Cannot land: weather is stormy" if stormy?

    fail "Cannot land: airport is full" if @planes.length >= @capacity

    @planes << plane
    "landed"
  end

  def take_off(_plane)
    fail "Cannot takeoff: weather is stormy" if stormy?

    "taken off"
  end

  def stormy?
    true
  end
end
