class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    plane.flying = false
    @planes << plane
  end

  def takeoff(plane)
    raise 'plane cannot takeoff in a storm' if stormy?
    plane.flying = true
    @planes.delete(plane)
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end

  def stormy?
    rand(1..2) % 2 == 0
  end

end
