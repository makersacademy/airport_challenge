require_relative 'airport'

plane = Plane.new
airport = Airport.new
airport.land(plane)
airport.take_off(plane)
