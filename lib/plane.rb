require_relative 'airport'

class Plane

  def initialize
    @flying = false
  end
  
  def land(airport) 
    fail "Already on the ground" if !flying
    @flying = false
    airport.landed(self)
  end
  
  def take_off(airport)
    fail "Already in the air" if flying
    @flying = true
    airport.leave_gate
  end
  
  private
  
  attr_reader :flying
  
end