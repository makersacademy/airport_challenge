class Airport

  DEFAULT_CAPACITY = 5

  def initialize capacity = DEFAULT_CAPACITY
    @planes = []
    @capacity = capacity
  end

  def allow_to_land(plane)
     plane.land
     @planes << plane
  end

  def allow_to_takeoff(plane)
    plane.takeoff
    @planes -= [plane]
  end

  attr_reader :planes
  attr_reader :capacity

end
