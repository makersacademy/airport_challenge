require './lib/plane'
require './lib/airport'

class AirTraffic

  def interrogate(plane)
    plane.location
  end

  def land(plane, airport)
    plane.land(airport)
    puts interrogate(plane)
    plane.in_flight
  end

  def takeoff(plane, destination_airport = plane::destination)
    plane.takeoff(destination_airport)
    puts interrogate(plane)
    plane.in_flight
  end
end
