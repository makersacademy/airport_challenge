require_relative "airport"

airport = Airport.new
plane = Plane.new
50.times {airport.land(Plane.new)}
airport.land(plane)
