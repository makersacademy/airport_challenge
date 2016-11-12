require_relative 'plane'

class AirportController

  def land_plane(plane)
    plane
  end

  def take_off_plane
    Plane.new
  end

end
