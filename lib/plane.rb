require_relative 'airport'

class Plane

  def land(airport)
    airport.planes << self
  end

  def take_off(airport)
    raise 'Too stormy to take off' if airport.stormy == true
    airport.planes.delete(self)
  end

end
