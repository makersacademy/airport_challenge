require_relative 'airport'

class Plane

  def initialize
    @flying = true
    @current_airport = nil
  end

  def flying?
    return @flying
  end

  def land(airport)
    if @flying == false; fail "This plane has already landed"; end
    @flying = false
    airport.planes << self
    @current_airport = airport
    return nil
  end

  def take_off
    if @flying == true; fail "This plane is already airbourne"; end
    @flying = true
    @current_airport.planes.delete(self)
    @current_airport = nil
    return nil
  end
end
