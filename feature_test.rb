require "./lib/airport"
require "./lib/plane"

airport = Airport.new(10)
plane = Plane.new
10.times{ airport.land(plane) }
