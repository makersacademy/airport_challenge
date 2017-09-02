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
    fail 'Plane has already landed' if (planes.include?(plane))
    planes << plane
  end

  def take_off(plane)
    fail 'Plane must land first before it can take off' unless (planes.include?(plane))
    planes.pop
  end

private
attr_reader :planes

end
