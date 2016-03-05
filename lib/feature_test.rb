require_relative "airport"

airport = Airport.new
plane = Plane.new
airport.land(plane)
p airport.planes
airport.take_off(plane)
