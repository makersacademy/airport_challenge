require_relative 'plane'

class Airport

  def land_plane
    Plane.new
  end

  def take_off(departing_plane)
    departing_plane.in_flight
  end

end
