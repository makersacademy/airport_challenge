require './lib/plane'

class Airport

  def land_plane(plane)
    plane.flight_status = :landed
  end

end
