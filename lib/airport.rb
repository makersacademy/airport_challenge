require_relative 'planes'

class Airport
  attr_reader :planes
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "Airport full" if full?
    raise "Too stormy to land" if stormy?
    raise "Plane has already landed" if planes.include?(plane)

    planes << plane
  end

  def take_off
    raise 'Too stormy to take off' if stormy?

    plane_taken_off
    @planes.pop
  end

private

  def stormy?
    rand(1..10) > 6
  end

  def full?
    planes.count >= capacity
  end

  def plane_taken_off
    'Plane taken off'
  end
end
