class Airport
  CAPACITY_DEFAULT = 5

  def initialize(capacity: CAPACITY_DEFAULT)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Airport full' if full?
    @planes << plane
  end

  def takeoff(plane)
    @planes.delete(plane)
  end

  private

  def full?
    @planes.length >= @capacity
  end
end
