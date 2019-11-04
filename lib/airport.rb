require_relative 'plane'

class Airport
  def land_plane
    Plane.new
  end

  def landed(plane)
  end

  def take_off(plane)
  end 

  def plane
    @plane
  end
end
