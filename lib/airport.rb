require_relative 'plane'
class Airport  
  attr_reader :plane
  
  def land(plane)
    fail "Airport is Full" if @plane
    @plane = plane 
  end

  def take_off(*)
    "Plane has taken off"
  end

end
