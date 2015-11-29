require_relative 'plane'

class Airport
  attr_reader :planes, :storm_level

  def initialize
    @planes = []
    @storm_level = 8
  end

  def tell_plane_to_land(plane)
    plane.land
    planes << plane
  end

  def tell_plane_to_take_off(plane)
    fail "Plane can't take off in a storm" if storm_level == 10
    plane.take_off
    planes.delete(plane)
  end

  def storm
    @storm_level = 10
  end

end
