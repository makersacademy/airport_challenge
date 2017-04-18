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
    fail 'Cannot land because of bad weather' if stormy?
    fail 'Airport at capacity' if full?
    fail 'Plane has already landed' if landed?(plane)
    planes << plane
  end

  def landed?(plane)
    planes.include?(plane)
  end

  def take_off(plane)
    fail 'Plane is not in airport' if landed?(plane) == false
    fail 'Cannot take off because of the bad weather' if stormy?
    planes.delete(plane)

  end

  def departed?(plane)
    landed?(plane) == false
  end

  def full?
    planes.count >= capacity
  end


end







