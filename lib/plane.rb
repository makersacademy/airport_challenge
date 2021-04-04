require_relative 'airport'
class Plane
  def land(airport)
    fail 'airport full' if airport.full?
    
    airport.hanger = self
  end

  def take_off
    @at_airport = false
    return nil
  end

  def in_air?
    !@at_airport
  end    
end
  