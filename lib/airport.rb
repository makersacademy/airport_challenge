require_relative 'plane'

class Airport
  attr_reader :plane
  def land
    Plane.new
  end

  def land_plane(plane)
    @plane = plane
  end

  def take_off
    Plane.new
  end

  def plane_depart(plane)
    @plane = plane
  end

end
