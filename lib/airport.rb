require_relative 'plane'
class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 10
  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end
  def land(plane)
    fail "Airport is at maximum capacity" if full?
    @planes << plane
  end
  def takeoff(plane)
    @planes.delete(plane)
    plane
  end

  private
  def full?
    @planes.count >= @capacity
  end
end
