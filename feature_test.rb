require "./lib/airport"
require "./lib/plane"

airport = Airport.new()
plane = Plane.new
airport.it_stormy?
airport.land(plane)

airport = Airport.new()
plane = Plane.new
airport.it_stormy?
airport.take_off(plane)
