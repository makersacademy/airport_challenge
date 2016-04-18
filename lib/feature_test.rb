require './lib/airport.rb'

airport = Airport.new

plane = Plane.new

airport.land(plane)

3.times{airport.land(Plane.new)}

airport.takeoff(plane)
