require './lib/plane'
require './lib/weather'

class Airport

  def initialize(weather)
    @weather = weather.stormy?
  end

  def land(plane)
    "Plane has landed."
  end

  def takeoff(plane)
    fail "Too stormy for takeoff." if @weather
    "Plane has taken off."
  end

end
