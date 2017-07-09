require "plane"

class Airport
  attr_reader :capacity
  attr_accessor :planes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "Airport is full" if planes.length == capacity
    fail "Plane has already landed" if planes.include?(plane)
    planes << plane
  end

  def takeoff(plane)
    fail "Only planes in an airport can take off from it" unless in_airport?(plane)
    planes.delete(plane)
  end

  def in_airport?(plane)
    planes.include?(plane)
  end

end
