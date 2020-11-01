require_relative 'Airport'

class Plane

  def land(airport)
    fail "Airport full!" if airport.planes.count >= 1
    airport.planes.push(self)

  end

  def take_off(airport)
    airport.planes.delete(self)
    "Plane no longer in airport"

  end
end
