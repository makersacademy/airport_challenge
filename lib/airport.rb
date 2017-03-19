
class Airport

DEFAULT_CAPACITY = 20
attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @all_planes = []
  end

  def land(plane)
    fail 'Airport full' if full?
    @all_planes << plane
  end

  def take_off
    @all_planes.pop
  end

private
attr_reader :plane

  def full?
    @all_planes.count >= capacity
  end
end
