require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :planes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def let_land(plane)
    raise 'Impossible, airport full' if full?
    raise 'Impossible, plane already landed' if plane.landed == true
    plane.landed = true
    plane.flying = false
    planes << plane
  end

  def let_take_off(plane)
    raise 'Impossible to take off, plane is already flying' if plane.flying == true
    plane.flying = true
    plane.landed = false
    planes.delete(plane)
    planes
  end

  private

  def full?
    return true if planes.count >= capacity
  end

end
