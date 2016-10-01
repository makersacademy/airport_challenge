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
    fail "Can't land as already landed" if
    plane.flying == false
    plane.flying = false
    @planes << plane
  end

  def take_off(plane)
    fail "Can't take off as already flying" if plane.flying?
    fail "Can't take off as plane doesn't exist" if self.exists(plane) == false
    plane.flying = true
    @planes.pop
  end

  def empty?
    @planes.empty?
  end

  def full?
    @planes.count >= @capacity
  end

  def exists(plane)
    @planes.include? plane
  end
end
