require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 70
  attr_reader :capacity

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def land(plane)
    fail 'Airport is at full capacity' if full?
    planes << plane
    'Plane has landed'
  end

  def take_off(_plane)
    planes.pop
    'Plane has taken off'
  end

  private

  attr_reader :planes

  def full?
    planes.count >= capacity
  end
end
