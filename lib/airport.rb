class Airport
  def initialize
    @planes = []
  end
  def land(plane)
    @planes << plane
  end
  def takeoff(plane)
    @planes.delete(plane)
  end
  def at_airport?(plane)
    @planes.include?(plane)
  end
end
