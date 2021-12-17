require_relative 'airport'

class Plane

  def land(airport)
    raise 'Landing prevented: Airport full' if airport.full?
    airport.send_to_hangar(self)
    airport
  end

  def take_off(airport)
    airport.taxi_to_runway(self)
    return "#{self} is no longer in #{airport}" 
  end
end
