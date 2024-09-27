
class Airport
  DEFAULT_CAPACITY = 50

  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Cannot land plane due to stormy weather' if stormy?
    fail 'Cannot land since airport is full' if full?
    @planes << plane
  end

  def takeoff(plane)
    fail 'Cannot take off due to stormy weather' if stormy?
  end

  private

  attr_reader :planes

  def stormy?
    rand(1..10) > 8
  end

  def full?
    @planes.count >= capacity
  end
end