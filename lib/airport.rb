require_relative 'plane'

class Airport
  attr_reader :landed_planes #allows reading of @landed_planes

  def initialize
    @landed_planes = []
  end

  def land(plane)
    @landed_planes << plane
    plane.landed = true
  end

  def takeoff(plane)
    plane.landed = false
    @landed_planes.delete(plane)
  end
end
