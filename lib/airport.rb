require_relative 'plane'

class Airport

  def land(plane)
    plane
  end

  def take_off
    Plane.new
  end

end
