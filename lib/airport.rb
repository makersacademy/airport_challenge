class Airport
  def initialize
    @landed_planes = []
  end

  def landed_planes
    @landed_planes
  end

  def land(plane)
    fail "Error: Max capacity for planes in Airport has been reached." if landed_planes.count >= 5
    landed_planes << plane
  end

  def take_off(plane)
    landed_planes.delete(plane)
  end
end
