require_relative 'plane'

class Airport

  def land_plane
    Plane.new
  end

  def take_off(plane)
    # stores the plane in the 'state' of this instance
    @plane = plane
  end

  def plane
    # returns plane 
    @plane
  end

end
