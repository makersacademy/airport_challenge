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
    fail "selected plane already landed at airport" if already_landed?(plane)
    plane.touch_down
    @landed_planes << plane
    @landed_planes.last
  end

  def take_off(plane = @landed_planes.last)
    fail "airport experiencing stormy weather" unless Weather.clear?
    fail "no planes at airport" if empty?
    fail "selected plane not currently at airport" unless already_landed?(plane)
    plane.up_up_and_away
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

  def already_landed?(plane)
    @landed_planes.include?(plane)
  end

end
