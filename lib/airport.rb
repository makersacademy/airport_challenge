class Airport
  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport full' if full?
    plane.land
    planes << plane
  end

  def take_off(plane)
    fail 'Plane not at airport' unless include?(plane)
    plane.take_off
    planes.delete(plane)
  end

  def include?(plane)
    planes.include?(plane)
  end

  private

  attr_reader :planes, :capacity

  def full?
    planes.length == capacity
  end
end
