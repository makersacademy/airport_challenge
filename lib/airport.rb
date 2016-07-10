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
    fail "selected plane already landed at airport" if @landed_planes.include?(plane)
    @landed_planes << plane
    @landed_planes.last
  end

  def take_off(plane = nil)
    fail "airport experiencing stormy weather" unless Weather.clear?
    fail "no planes at airport" if empty?
    fail "selected plane not currently at airport" unless @landed_planes.include?(plane)
    @landed_planes.pop
    @airborn_planes << plane
  end

attr_reader :capacity

private

  def full?
    @landed_planes.count >= @capacity
  end

  def empty?
    @landed_planes.count == 0
  end

end
