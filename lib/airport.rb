require 'plane'

class Airport
  attr_reader :capacity
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def take_off(plane)
    fail 'Plane not in this airport' unless parked?(plane)

    plane.taken_off
    @planes.delete(plane)
  end

  def land(plane)
    fail "Airport full" if full?
    fail "Plane already landed" if parked?(plane)
    @planes << plane
  end

  private

  def full?
    @planes.size >= @capacity
  end
  
  def parked?(plane)
    @planes.include? plane
  end
end
