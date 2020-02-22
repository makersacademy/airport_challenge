require "./lib/airport"
require "./lib/plane"

airport = Airport.new()
plane = Plane.new
airport.is_it_stormy?
airport.land(plane)
