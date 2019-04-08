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

    @planes << plane
  end

  def take_off
    raise 'Too stormy to take off' if stormy?

    @planes.pop
  end


private

  def full?
    planes.count >= capacity
  end

end
