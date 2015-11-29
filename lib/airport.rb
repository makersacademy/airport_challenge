require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 50

  attr_reader :planes
  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Airport is full' if full?
    plane.landplane
    @planes << plane
  end

  def takeoff(plane)
    fail 'Airport is empty' if empty?
    plane.fly
    @planes.delete(plane)
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.empty?
  end
end
