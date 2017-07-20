require './lib/airport'
require './lib/plane'

plane = Plane.new
airport = Airport.new


p airport.land(plane)
p Airport.new
p 30.times { airport.land(plane) }
 p airport.land(plane)