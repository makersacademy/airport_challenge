require_relative 'plane'

class Airport
  def create_plane
    Plane.new
  end

  def land(plane)
    plane
  end
end
