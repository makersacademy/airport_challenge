require './lib/airport'

class TrafficControl

  def take_off plane, airport
    raise "Plane flying so cannot take_off" if plane.status == "flying"
    airport.takes_off(plane)
    plane.status = "flying"
    plane.location = "in-air"
  end

end