require_relative 'plane'

class Airport
  attr_reader :plane, :planes, :capacity
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def full?
    planes.count >= @capacity
  end

  def stormy?
    rand(1..5) == (1..5)
  end

  def land(plane)
    fail 'Airport is full' if full?
    fail 'Storm prevented landing' if stormy?

    @planes << plane
  end

  def take_off(plane)
    fail 'Storm prevented take off' if stormy?

    @plane = plane
  end
end
