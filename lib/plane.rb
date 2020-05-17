require 'weather'
require 'airport'

class Plane
  attr_accessor :plane

  def location(plane)
  end

  def land(plane)
    fail "Weather stormy, unable to land" if current_weather = "stormy"

    @plane = plane
  end

  def takeoff(plane)
    fail "Weather stormy, unable to take-off" if current_weather = "stormy"

    @plane = plane
  end
end