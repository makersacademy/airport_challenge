require 'airport'

class Plane
  attr_accessor :plane
  
  def land(plane, airport)
    airport.receive(plane)
  end

  def take_off(plane, airport)
    airport.release(plane)
  end
end
