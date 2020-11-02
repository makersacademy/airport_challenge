require '~/Projects/airport_challenge/lib/weather.rb'

class Plane

  def land(airport)
    airport.inbound_flight(self)
    "Plane #{self} landed at #{airport}."
  end

  def take_off(airport)
    airport.outbound_flight(self)
    "Plane #{self} took off from #{airport}."
  end

end
