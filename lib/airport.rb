require 'weather'

class Airport
  DEFAULT_CAPACITY = 15
  attr_reader :planes
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end
  
  def landed(plane)
    fail "It is too stormy to land." if weather == :stormy
    fail "Airport is full." if full?
    planes << plane
    "Plane has touched down!!"
  end
  
  def leave_gate
    fail "It is too stormy to take off." if weather == :stormy
    planes.pop
    "Plane has taken off!!"
  end
  
  private
  
  def full?
    @planes.count >= @capacity
  end
end