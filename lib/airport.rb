class Airport
  attr_reader :capacity, :planes, :name
  DEFAULT_CAPACITY = 10

  def initialize(name, capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @name = name
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def permission_to_take_off(plane)
    fail "Airport empty" if planes.count == 0
    fail "Weather stormy" if weather.is_stormy?
    fail "Invalid request" if (plane.status == "In-Flight" || plane.airport != self.name)
    plane.take_off
    confirm_take_off(plane)
    true
  end

  def permission_to_land(plane)
    fail "Airport at capacity" if is_full?
    fail "Weather stormy" if weather.is_stormy?
    fail "Invalid request" if plane.status == "Landed"
    plane.land(self.name)
    confirm_landing(plane)
    true
  end

  def confirm_landing(plane)
    planes << plane if (plane.status == "Landed" && plane.airport == self.name)
  end

  def confirm_take_off(plane)
    planes.delete(plane) if (plane.status == "In-Flight" && plane.airport == self.name)
  end

  private

  def is_full?
    planes.count >= capacity
    # true or false depending on number of planes & capacity
  end

  attr_reader :weather

end
