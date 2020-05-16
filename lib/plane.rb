require_relative 'airport'

class Plane

  def land(airport)
    airport.landing(self)
  end

  def take_off(airport)
    airport.depart(self)
  end 

end
