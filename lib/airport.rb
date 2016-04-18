require_relative 'weather'
require_relative 'plane'

include Weather

class Airport
  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Cannot land because of bad weather' if self.stormy?
    fail 'Airport at capacity' if full?
    fail 'Plane has already landed' if self.landed?(plane)
    planes << plane
  end

  def landed?(plane)
    self.planes.include?(plane)
  end

  def take_off(plane)
    fail 'Plane is not in airport' if self.landed?(plane) == false
    fail 'Cannot take off because of the bad weather' if self.stormy?
    planes.reject{ |planes| planes == plane }

  end

  def departed?(plane)
    self.landed?(plane) == false
  end

  def full?
    planes.count >= capacity
  end


end







