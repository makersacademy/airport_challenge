class Airport

  def initialize
    @landed_planes = []
  end

  def land(plane)
    @landed_planes << plane
  end

  def takeoff(plane)
    @landed_planes.delete(plane)
    "#{plane} has left the Airport"
  end
end
