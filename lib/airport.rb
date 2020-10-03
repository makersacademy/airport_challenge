require_relative 'plane'

class Airport
  def land(plane)
  end

  def take_off(plane)
    plane.flying
    plane
  end
end
