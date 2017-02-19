class Airport
  attr_reader :capacity, :planes, :name
  DEFAULT_CAPACITY = 10

  def initialize(name, capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @name = name
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def initiate_take_off_procedure(plane)
    fail "Airport empty" if planes.count == 0
    fail "Weather stormy" if weather.is_stormy?
    fail "Sorry, You are either flying or not at #{self.name}" if (plane.status == "In-Flight" || plane.location != self.name)
    plane.take_off
    confirm_take_off(plane)
    true
  end

  def initiate_landing_procedure(plane)
    fail "Airport at capacity" if is_full?
    fail "Weather stormy" if weather.is_stormy?
    fail "Sorry, You are already on ground" if plane.status == "Landed"
    plane.land(self.name)
    confirm_landing(plane)
    true
  end

  private
  
  def confirm_landing(plane)
    planes << plane if (plane.status == "Landed" && plane.location == self.name)
  end

  def confirm_take_off(plane)
    planes.delete(plane) if (plane.status == "In-Flight" && plane.location == self.name)
  end

  def is_full?
    planes.count >= capacity
    # true or false depending on number of planes & capacity
  end

  attr_reader :weather

end
