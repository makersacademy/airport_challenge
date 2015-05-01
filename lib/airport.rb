class Airport

  def initialize
    @planes = []
  end

  def receive plane
    plane.land
    @planes << plane
  end

  def launch plane
    plane.takeoff
    @planes.delete(plane)
  end

  def planes
    @planes
  end

end
