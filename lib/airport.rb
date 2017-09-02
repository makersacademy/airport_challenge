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
    fail 'Plane is not at the airport' unless (planes.include?(plane))
    planes.slice!(planes.index(plane))
  end

private
attr_reader :planes

end
