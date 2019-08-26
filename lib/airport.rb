require_relative 'plane'

class Airport
  attr_reader :plane

  def land_a_plane(plane)
    @plane = plane
  end

  def take_off_plane
    Plane.new
  end

end
