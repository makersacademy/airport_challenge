require './lib/plane'

class Airport

  def land(plane)
    plane.landed = true
    plane
  end

  def takeoff(plane)
    plane.landed = false
    plane
  end

end
