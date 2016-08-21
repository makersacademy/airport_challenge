require_relative 'plane'
require_relative 'weather'

class Airport

@planes = []

  def conditions
    @weather
  end

  def land(plane)
    fail "Too stormy" if conditions == "stormy"
    plane
  end

  def take_off(plane)
    fail "Too stormy" if conditions == "stormy"
    plane.landed = false
    plane
  end

end
