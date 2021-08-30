require_relative "plane"
class Airport 
 
  def initialize
    @hangar = []
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
    @hangar.size >= 1
  end
end