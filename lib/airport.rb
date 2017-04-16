require 'plane'
require 'weather'

class Airport

#  def initializes
#    @weather = Weather.stormy?
#  end

  def land(plane)
    "Plane has landed."
  end

  def takeoff(plane)
    fail "Too stormy for takeoff." if Weather.stormy?
    "Plane has taken off."
  end

end
