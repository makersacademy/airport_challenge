require_relative 'plane'

class Airport
DEFAULT_CAPACITY = 20
attr_reader :capacity

  def initialize(cap = DEFAULT_CAPACITY)
    @capacity = cap
    @planes = []
  end

  def land(plane)
    fail 'Airport is full' if (planes.count >= capacity)
    planes << plane
  end

  def take_off(plane)
    planes.pop
  end

private
attr_reader :planes

end
