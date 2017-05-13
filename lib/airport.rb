class Airport

  attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def land(plane)
    @landed_planes << plane
    'Plane has landed'
  end

  def plane_takeoff
    @landed_planes.pop
  end
end
