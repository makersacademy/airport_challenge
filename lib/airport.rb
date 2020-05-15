require_relative 'plane'

class Airport

  def land(plane)
    fail "Airport full" if @plane  
    @plane = plane
  end

  def take_off
   return "Plane has taken off"
  end
end