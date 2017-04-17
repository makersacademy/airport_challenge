require './lib/plane'
require './lib/weather'

class Airport
  DEFAULT_CAPACITY = 100
  attr_accessor :capacity

  def initialize(weather)
    @capacity = DEFAULT_CAPACITY
    @weather = weather.stormy?
  end

  def land(plane)
    fail "Plane has aleady landed." unless plane.flying
    fail "Too stormy for landing." if @weather
    plane.land
    "Plane has landed."
  end

  def takeoff(plane)
    fail "Plane is already flying." if plane.flying
    fail "Too stormy for takeoff." if @weather
    plane.takeoff
    "Plane has taken off."
  end

end
