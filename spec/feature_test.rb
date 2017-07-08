require './lib/airport.rb'
require './lib/plane.rb'

airport = Airport.new
plane = Plane.new
p airport.land(plane)
p airport.plane
p airport.take_off(plane)
p airport.plane 
