class Airport
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "Cannot land: weather is stormy" if stormy?

    fail "Cannot land: airport is full" if full?

    @planes << plane
    "landed"
  end

  def take_off(_plane)
    fail "Cannot takeoff: weather is stormy" if stormy?

    "taken off"
  end

  private

  def stormy?
    rand(1..6) > 4
  end

  def full?
    @planes.length >= @capacity
  end
end
