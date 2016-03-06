require './lib/airport.rb'

airport = Airport.new
plane = Plane.new

3.times{airport.land(plane)}

airport.takeoff(plane)
