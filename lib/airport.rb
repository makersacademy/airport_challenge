class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "Cannot land - Airport full!" if full?
    raise "Cannot land - Stormy" if stormy?
    @planes << plane
  end

  def takeoff(plane)
  end

private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    rand(1..6) > 4
  end

end
