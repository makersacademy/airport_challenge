require "./lib/airport"
require "./lib/plane"

airport = Airport.new(5)
plane = Plane.new
airport.land(plane)

airport.takeoff(plane)
airport.planes.empty?

#5.times {airport.land(plane)}
