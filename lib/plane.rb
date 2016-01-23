require 'airport'

class Plane
  def land(airport) 
    airport.landed(self)
  end
  
  def take_off(airport)
    airport.leave_gate
  end
end