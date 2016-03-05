require_relative "airport"

airport = Airport.new
plane = Plane.new
airport.land(plane)
airport.planes
p airport.take_off(plane)
