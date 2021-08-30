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
end