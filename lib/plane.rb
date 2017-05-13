require_relative 'airport.rb'

class Plane

  def land(airport)
    airport.plane = self
  end

  def take_off(airport)
    airport.plane = nil
  end

end
