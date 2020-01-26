require_relative 'plane'

class Airport
  def land(plane)
    true
  end

  def takeoff(plane)
    "Plane has left"
  end
end