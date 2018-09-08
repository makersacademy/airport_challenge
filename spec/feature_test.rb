require './lib/airport'
airport = Airport.new
plane = Plane.new
airport.take_off(plane)
airport.land(plane)
airport.planes?
