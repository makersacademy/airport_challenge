require "./lib/airport"
require "./lib/plane"

airport = Airport.new
plane = Plane.new
airport.land(plane)

airport.takeoff(plane)
airport.plane == nil
