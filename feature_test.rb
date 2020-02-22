require "./lib/airport"
require "./lib/plane"

airport = Airport.new()
plane = Plane.new
weather = airport.is_it_stormy?
airport.take_off(plane)
