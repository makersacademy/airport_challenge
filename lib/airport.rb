require_relative 'plane'
require_relative 'weather'

class Airport

  def conditions
    @weather
  end

  def land(plane)
    plane = Plane.new
    plane
  end

  def take_off
    fail "Too stormy" if conditions == "stormy"
    plane = Plane.new
    plane.landed = false
    plane
  end

end
