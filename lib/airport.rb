require './lib/plane'

class Airport

  def land(plane)
    plane.flight_status = :landed
  end

  def takeoff(plane)
    plane.flight_status = :taken_off
  end

end
