require_relative 'plane'
class Airport
  attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def land(plane)
    @landed_planes.push(plane)
  end

  def takeoff
    @landed_planes.pop
  end
end
