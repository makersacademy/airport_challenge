require_relative 'plane'
require_relative 'weather'

class Airport
DEFAULT_CAPACITY = 20
attr_reader :capacity

  def initialize(cap = DEFAULT_CAPACITY)
    @capacity = cap
    @planes = []
  end

  def land(plane)
    fail 'Airport is full' if full?
    fail 'Plane has already landed' if (planes.include?(plane))
    planes << plane
  end

  def take_off(plane)
    fail 'Plane is not at the airport' unless (planes.include?(plane))
    planes.slice!(planes.index(plane))
  end

private

attr_reader :planes

  def full?
    planes.count >= capacity
  end

end
