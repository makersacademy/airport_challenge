require './lib/plane'
require './lib/weather'

class Airport

  def initialize(weather)
    @weather = weather.stormy?
  end

  def land(plane)
    fail "Plane has aleady landed." unless plane.flying
    plane.flying = false
    "Plane has landed."
  end

  def takeoff(plane)
    fail "Plane is already flying." if plane.flying
    fail "Too stormy for takeoff." if @weather
    plane.flying = true
    "Plane has taken off."
  end

end
