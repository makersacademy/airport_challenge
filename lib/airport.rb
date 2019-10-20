class Airport
  attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def land(plane)
    @landed_planes << plane
  end

  def takeoff(plane)
    "Plane safely taken off."
  end
end
