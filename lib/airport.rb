class Airport

  def initialize
    @landed_planes = []
  end

  def landed_planes
    @landed_planes.dup
  end

  def clear_to_land(plane)
    @landed_planes << plane
  end

  def clear_to_takeoff
    @landed_planes.pop
  end
end
