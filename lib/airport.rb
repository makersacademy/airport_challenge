require_relative 'plane'

class Airport

  def land_plane(inbound_plane)
    inbound_plane.touch_down
  end

  def take_off(departing_plane)
    departing_plane.in_flight
  end

end
