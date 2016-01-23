require_relative 'airport'

class Plane

  def initialize
    @flying = false
    @on_ground = true
  end
  
  def land(airport) 
    fail "Already on the ground" if on_ground
    airport.landed(self)
  end
  
  def take_off(airport)
    fail "Already in the air" if flying
    @flying = true
    @on_ground = false
    airport.leave_gate
  end
  
  private
  
  attr_reader :flying, :on_ground
  
end