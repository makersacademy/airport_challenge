class Airport
  attr_reader :plane, :weather, :capacity

  def initialize(plane, weather, capacity=10)
    @plane = []
    @weather = weather
    @capacity = capacity
  end

  def take_off(plane)
    fail "Weather is too stormy" if @weather == "stormy"
    plane
  end

  def land(plane)
    Plane.new
  end

  def full?
    plane.count >= capacity
  end

  def plane_in_airport?
    true
  end

end
