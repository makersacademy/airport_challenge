require './lib/airport.rb'
require './lib/plane.rb'

airport = Airport.new
plane = Plane.new
p airport.land(plane)
p airport.plane
#p airport.landed?(plane)
