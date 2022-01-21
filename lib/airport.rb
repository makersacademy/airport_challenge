require_relative 'plane'

class Airport
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'The Airport is full, you cannot land' if full?
    @planes << plane
  end

  def takeoff
    @planes.pop
  end

  def full?
    @planes.count >= @capacity
  end

end
