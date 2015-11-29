require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def tell_plane_to_land(plane)
    plane.land
    planes << plane
  end

  def tell_plane_to_take_off(plane)
    plane.take_off
    planes.delete(plane)
  end
end
