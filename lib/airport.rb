require './lib/plane'
require './lib/weather'

class Airport
  DEFAULT_CAPACITY = 100
  attr_accessor :capacity, :planes

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @weather = weather.stormy?
    @planes = []
  end

  def land(plane)
    fail "Airport is at capacity." if @planes.size == @capacity
    fail "Plane has aleady landed." unless plane.flying
    fail "Too stormy for landing." if @weather
    @planes << plane
    plane.land
    "Plane has landed."
  end

  def takeoff(plane)
    fail "Plane is already flying." if plane.flying
    fail "Too stormy for takeoff." if @weather
    plane.takeoff
    @planes.delete(plane)
    "Plane has taken off."
  end

end
