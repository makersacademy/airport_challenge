require 'weather'

class Airport

  def land(plane)
    plane
  end

  def takeoff(plane)
    raise 'Weather is too stormy to takeoff' if stormy?

    plane_taken_off
    plane
  end

  private

  def stormy?
    rand(1..6) > 4 
  end

  def plane_taken_off
    'Plane has taken off'
  end
end
