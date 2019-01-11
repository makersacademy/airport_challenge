require_relative 'airport'

class Plane
  def land(airport)
    airport.planes << self
  end
end
