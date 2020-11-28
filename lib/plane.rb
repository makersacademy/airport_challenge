require_relative '../lib/airport'

class Plane

  def land(airport)
    airport.ramp << self
  end

  def takeoff(airport)
    airport.ramp.delete(self)
  end

end
