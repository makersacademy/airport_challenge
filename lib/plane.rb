require_relative 'airport'

class Plane
  def land(airport)
    airport.planes.push(self)
  end
end
