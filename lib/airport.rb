class Airport
  attr_reader :capacity, :planes
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def permission_to_take_off(plane)
    fail "Airport empty" if planes.count == 0
    fail "Weather stormy" if weather.is_stormy?
    fail "Invalid request" if (plane.status == "In-Flight" || plane.airport != self)
    plane.take_off
    self.confirm_take_off(plane)
    true
  end

  def permission_to_land(plane)
    fail "Airport at capacity" if is_full?
    fail "Weather stormy" if weather.is_stormy?
    fail "Invalid request" if plane.status == "Landed"
    plane.land(self)
    self.confirm_landing(plane)
    true
  end

  def confirm_landing(plane)
    planes << plane if (plane.status == "Landed" && plane.airport == self)
  end

  def confirm_take_off(plane)
    planes.delete(plane) if (plane.status == "In-Flight" && plane.airport == self)
  end

  private

  def is_full?
    planes.count >= capacity
    # true or false depending on number of planes & capacity
  end

  attr_reader :weather

end
