require_relative 'plane'

class Airport
  def take_off
    Plane.new
  end
  def land(plane)
    plane
  end
end
