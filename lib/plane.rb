require './lib/airport.rb'

class Plane
  def land(airport)
    airport.planes << self
    "Landed in #{airport}"
  end

  def takeoff(airport)
    airport.planes.delete(self)
    "Departed from #{airport}"
  end
end
