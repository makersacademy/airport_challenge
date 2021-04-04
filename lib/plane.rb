require_relative 'airport'
class Plane
  def initialize
    @on_ground = true
  end
  def land(airport)
    fail 'airport full' if airport.full?
    
    airport.hanger.push(self)
    @on_ground = true
  end

  def take_off
    fail 'plane in air' if self.in_air?
    @on_ground = false
    return nil
  end

  def in_air?
    !@on_ground
  end    
end
  