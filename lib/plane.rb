require_relative 'airport'

class Plane
  def land(airport) 
    airport.landed(self)
  end
  
  def take_off(airport)
    airport.leave_gate
  end
end

#
#plane = Plane.new
#airport = Airport.new
#plane.take_off(airport)
#plane.take_off(airport)
#plane.take_off(airport)
#plane.take_off(airport)