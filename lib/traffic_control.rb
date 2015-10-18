require './lib/airport'

class TrafficControl

  def take_off plane, airport
    raise "Plane flying so cannot take_off" if plane.flying?
    airport.take_off(plane)
    plane.take_off
  end

  def land plane, airport
    raise "Plane not flying so cannot land" if !plane.flying?
    airport.land(plane)
    plane.land(airport)
  end

end