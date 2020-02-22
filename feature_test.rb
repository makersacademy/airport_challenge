require "./lib/airport"
require "./lib/plane"

airport = Airport.new()
plane = Plane.new
5.times { airport.land(plane) }
