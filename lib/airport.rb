require_relative '../lib/plane'

class Airport
  attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def land(plane)
    @landed_planes << plane
  end

  def takeoff(plane)
    @landed_planes.delete(plane)
    @landed_planes
  end
end
