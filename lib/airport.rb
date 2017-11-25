require_relative "plane"

class Airport

  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport full" if full?
    fail "Plane is already landed" if plane.landed == true
    @planes << plane
    plane.land
  end

  def take_off(plane)
    fail "Plane not in airport" if !@planes.include?(plane)
    @planes = @planes - [plane]
    plane.take_off
  end

private

  def full?
    @planes.length >= capacity
  end

end
