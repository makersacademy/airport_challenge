require 'plane'
require 'airport'

#makes a new plane
plane = Plane.new

#makes a new airport
airport = Airport.new

#let a plane land at an airport
airport.land(plane) #=> <Plane:0x007fcd9a84f728>

#check if the plane is landed
plane.landed? #=> true
