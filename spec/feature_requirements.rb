require "./lib/airport"

  airport = Airport.new
  plane = Plane.new
  weather = Weather.new
  airport.land(plane)
  airport.take_off(plane)
