class Airport
  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Plane is unable to land: airport is full' if full?
    @planes << plane
  end

  def takeoff(plane)
  end

  private

  def full?
    @planes.length >= @capacity
  end
end
