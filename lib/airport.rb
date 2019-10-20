class Airport
  attr_reader :planes

  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "cannot land the plane: airport at capacity!" if full?
    raise "cannot land the plane: weather is stormy!" if stormy?
    @planes << plane
  end

  def take_off(plane)
    raise "cannot take off: weather is stormy!" if stormy?
    @planes
  end

  def stormy?
    rand(1..6) > 4
  end

  def full?
    @planes.length >= @capacity
  end
end
