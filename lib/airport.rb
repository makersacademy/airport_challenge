require_relative "plane"
class Airport 

  DEFAULT_CAPACITY = 4
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end
  def land(plane)
    @hangar << plane
    plane
  end
  def take_off(plane)
    @hangar.pop 
    return 'Plane no longer in the airport' 
  end
  def prevent_landing(plane)
    fail "Sorry, the airport is full" if full?
    @hangar << plane
  end
  def full?
    @hangar.size >= DEFAULT_CAPACITY
  end
end