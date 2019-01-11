require_relative 'plane'

class Airport
  attr_reader :plane, :planes, :capacity
  DEFAULT_CAPACITY = 50

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def full?
    planes.count >= @capacity
  end

  def land(plane)
    fail 'Airport is full' if full?
    @planes << plane
  end

  def take_off(plane)
    @plane = plane
  end
end
