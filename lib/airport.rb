class Airport
  def initialize
    @planes = []
  end

  def land(plane)
    raise 'Plane is already landed in airport' if landed?(plane)
    @planes << plane
  end

  def takeoff(plane)
    raise 'Plane not in airport' unless landed?(plane)
    @planes.delete(plane)
  end

  def landed?(plane)
    @planes.include?(plane)
  end
end
