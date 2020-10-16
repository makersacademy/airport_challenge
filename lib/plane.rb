require_relative 'airport'

class Plane

  def land(airport)
    airport.landed_planes << self
  end

  def take_off(airport)
    airport.landed_planes.delete(self)
  end

end
