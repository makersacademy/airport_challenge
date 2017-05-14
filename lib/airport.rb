require_relative 'plane'

class Airport

  def land_plane
    Plane.new
  end

  def take_off(plane)
    # let plane take off that landed
    plane
  end

  def plane
  end

end
