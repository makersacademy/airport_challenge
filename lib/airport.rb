require_relative 'plane'

class Airport

  def get_plane
    Plane.new
  end

  def plane
    @plane
  end

  def land(plane)
    @plane = plane
  end

end
