# airport challenge app
require_relative 'plane'

class Airport
  
  def plane
    @plane
  end

  def land_plane
    Plane.new
  end

  def take_off_plane(plane)
    @plane = plane
  end
end
