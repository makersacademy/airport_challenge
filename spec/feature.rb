require './lib/airport'
airport = Airport.new
plane = Plane.new

p airport.land(plane)
p airport.take_off
