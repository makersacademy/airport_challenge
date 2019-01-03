class Airport
  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Plane is unable to land: airport is full' if full?
    raise 'Warning: Storm approaching, unable to land plane' if stormy?
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
