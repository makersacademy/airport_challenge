class Airport

  def initialize
    @planes = []
  end

  def planes
    @planes
  end

  def receive(plane)
    @planes << plane
  end

  def sendoff(plane)
    @planes.delete(plane)
  end

end
