require './lib/plane'

class Airport

attr_reader :plane, :capacity

DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport is at capacity" if full?
    @planes << plane
  end

  def take_off
    @planes.pop
  end

  def empty?
    @planes.empty?
  end

  def full?
    @planes.count >= @capacity
  end
end
