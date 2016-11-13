require_relative "plane"
require_relative "weather"

include

class Airport
include Weather
attr_reader :planes, :capacity
DEFAULT_CAPACITY = 15

def initialize(capacity = DEFAULT_CAPACITY)
  @capacity = capacity
  @planes = []
end

def dock(plane)
  fail "Airport is full" if full?
  planes << plane
end

def taxi(plane)
  fail "Plane is not at this airport" if !planes.include?(plane)
  fail "Plane already in the air" if !plane.landed
  fail "Too stormy to taxi plane" if !sunny?
  plane.landed = false
  planes.delete(plane)
end

end

def full?
  planes.count >= capacity
end
