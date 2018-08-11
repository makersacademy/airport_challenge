class Airport
  def initialize
    @planes = []
  end
  def land(plane)
    plane.flying = false
    @planes << plane
  end
  def takeoff(plane)
    plane.flying = true
    @planes.delete(plane)
  end
  def at_airport?(plane)
    @planes.include?(plane)
  end
end
