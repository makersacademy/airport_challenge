class Airport
  attr_reader :planes
  attr_reader :capacity

  DEFAULT_CAPACITY = 30

  def initialize capacity = DEFAULT_CAPACITY
    @capacity = capacity
    @planes = []
  end

  def land plane
    fail("No space to land at this airport!") if full?
    plane.land_at(self)
    @planes << plane
  end

  def take_off plane
    fail("Plane is not at this airport!") unless @planes.include?(plane)
    plane.take_off
    @planes -= [plane]
  end

  private

  def full?
    @planes.length >= @capacity
  end

end
