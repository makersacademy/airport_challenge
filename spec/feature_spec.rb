require 'plane'
require 'airport'

#makes a new plane
plane = Plane.new #=> <Plane:0x007fcd9a84f728>

#makes a new airport
airport = Airport.new #=> <Airport:0x007f8fc88a5570>

#let a plane land at an airport
airport.land(plane) #=> <Plane:0x007fcd9a84f728>

#check if the airport has the landed plane
airport.plane #=> <Plane:0x007fcd9a84f728>

#check if the plane is landed
plane.landed? #=> true
