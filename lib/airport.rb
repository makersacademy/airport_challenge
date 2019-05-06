require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10
  # default capacity can be amended if needed
  attr_accessor :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport full" if full?

    @planes << plane
  end

  def take_off
    @planes.pop
  end

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end
end
