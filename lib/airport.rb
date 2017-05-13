require_relative 'plane'

class Airport
  attr_reader :landed_planes, :capacity

  def initialize
    @landed_planes = []
    @capacity = 20
  end

  def land_plane(plane)
    plane.land
    @landed_planes << plane
    @landed_planes
  end

  def clear_plane(plane)
    plane.take_off
    @landed_planes.delete(plane)
    @landed_planes
  end

end
