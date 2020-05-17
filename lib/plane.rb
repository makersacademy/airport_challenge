require_relative 'airport'

class Plane

  def land(airport)
    airport.land(self)
  end

end
