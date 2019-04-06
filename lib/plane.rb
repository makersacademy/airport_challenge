require_relative 'airport'

class Plane
  def land_at(airport)
    airport.hanger << self
  end
end
