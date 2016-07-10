require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_planes = []
    @airborn_planes = []
  end

  def land(plane)
    fail "airport experiencing stormy weather" unless Weather.clear?
    fail "airport full" if full?
    @landed_planes << plane
    @landed_planes.last
  end

  def take_off(plane)
    fail "airport experiencing stormy weather" unless Weather.clear?
    @landed_planes.pop
    @airborn_planes << plane
  end

attr_reader :capacity

private

  def full?
    @landed_planes.count >= @capacity
  end

end
