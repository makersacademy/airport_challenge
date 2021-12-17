class Airport
  attr_accessor :capacity

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane, weather)
    fail "Can not land, weather is stormy" if stormy?(weather)
    fail "Airport full" if full?
    @planes << plane
  end

  def take_off(plane, weather)
    fail "Can not take off, weather is stormy" if stormy?(weather)
    fail "Plane not in airport" unless includes?(plane)
    @planes.delete(plane)
  end

  private

  def full?
    @planes.count == capacity
  end

  def stormy?(weather)
    weather.stormy?
  end

  def includes?(plane)
    @planes.include?(plane)
  end
end
