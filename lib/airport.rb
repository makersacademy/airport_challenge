class Airport
  DEFAULT_CAPACITY = 2

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise 'airport full' if full?
    planes << plane
  end

  def take_off(plane)
    planes.delete(plane)
  end

  private

  def full?
    planes.length == capacity
  end
end
