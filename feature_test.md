require "./lib/airport.rb"

plane = Plane.new
Airport.land(plane)
Airport.take_off(plane)
Airport.is_here?(plane)
