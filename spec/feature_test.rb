require './airport_challenge/lib/airport.rb'
airport = Airport.new
plane1 = Plane.new
plane2 = Plane.new
airport.land(plane1)
airport.land(plane2)
airport
