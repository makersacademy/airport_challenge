require_relative 'Airport'

class Plane

  def land(airport)
    fail "Airport full!" if airport.planes.count >= airport.capacity
    fail "Stormy conditions preventing landing" if airport.stormy?

    airport.planes.push(self)
  end

  def take_off(airport)
    fail "It's stormy, cannot take off!" if airport.stormy?

    airport.planes.delete(self)
    "Plane no longer in airport"
  end
end
