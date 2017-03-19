require './lib/airport'
plane = Plane.new
plane.functioning?
airport = Airport.new
airport.land(plane)
