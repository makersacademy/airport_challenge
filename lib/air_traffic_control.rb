require_relative 'plane'

class AirTrafficControl
  def land_plane_at_airport(plane, airport)
    plane.land(airport)
  end

  def take_off_from_airport(plane)
    plane.take_off

  end
end
