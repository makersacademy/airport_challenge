require_relative 'airport'

class Plane

  def land(airport)
    airport.landing(self)
  end

end
