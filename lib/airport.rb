require_relative './plane'

class Airport
  attr_accessor :planes, :capacity

  DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Airport is full" if full?
    @planes << plane
  end

  def takeoff(plane)
    @planes.pop
  end

private

  def full?
    @planes.length >= @capacity
  end

end
