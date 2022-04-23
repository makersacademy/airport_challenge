class Airport
  DEFAULT_CAPACITY = 2

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport full' if full?
    planes << plane
  end

  def take_off(plane)
    fail 'Plane not at airport' unless contains?(plane)
    planes.delete(plane)
  end

  private

  def contains?(plane)
    planes.include?(plane)
  end

  def full?
    planes.length == capacity
  end
end
