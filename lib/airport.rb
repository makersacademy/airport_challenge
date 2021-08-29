class Airport
  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "Cannot land plane: airport full" if full?
    raise "Cannot land plane because it is stormy" if stormy?
    @planes << plane
  end

  def take_off(plane)
    raise "Cannot take off plane because it is stormy" if stormy?
  end

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    rand(1..6) > 4
  end
end
