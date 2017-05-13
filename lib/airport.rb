class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "Cannot land - Airport full!" if full?
    @planes << plane
  end

  def takeoff(plane)
  end

  def full?
    @planes.length >= @capacity
  end

end
