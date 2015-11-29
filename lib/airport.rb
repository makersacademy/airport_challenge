require_relative 'plane'

class Airport
  attr_reader :planes, :storm_level

  def initialize
    @planes = []
    @storm_level = rand(1..10)
  end

  def tell_plane_to_land(plane)
    fail "Plane can't land in a storm" if (plane.taken_off? == nil) && storm_level == 10
    plane.land
    planes << plane
  end

  def tell_plane_to_take_off(plane)
    fail "Plane can't take off in a storm" if (plane.landed? == true) && storm_level == 10
    plane.take_off
    planes.delete(plane)
  end


  def storm
    @storm_level = 10
  end

  def clear
    @storm_level = 1
  end

end
