require './lib/airport'
require './lib/plane'

plane = Plane.new
airport = Airport.new

p plane 
p airport

p airport.land(plane)
p airport.depart

p plane.airport
