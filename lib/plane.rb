require_relative './airport'

class Plane

  def land_at(airport)
    airport.planes = self
  end

  def take_off_from(airport)
    airport.planes = nil
  end

end