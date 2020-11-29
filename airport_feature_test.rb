require './lib/airport.rb'

airport = Airport.new
plane = Plane.new

p airport.land(plane)

p airport.takeoff(plane)

airport.full?
