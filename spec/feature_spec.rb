require 'plane'
require 'airport'

print 'makes a new plane: '
p plane = Plane.new #=> <Plane:0x007fcd9a84f728>

print 'makes a new airport: '
p airport = Airport.new #=> <Airport:0x007f8fc88a5570>

print 'let a plane #land at an airport: '
p airport.land(plane) #=> <Plane:0x007fcd9a84f728>

print 'check if the airport has the landed plane: '
p airport.planes #=> [<Plane:0x007fcd9a84f728>]

print 'check if the plane is landed: '
p plane.landed? #=> true

print 'make the plane #take_off from an airport: '
p airport.take_off #=> <Plane:0x007fcd9a84f742>

print 'confirm that the plane is no longer in the airport: '
p airport.planes #=> []

print 'whatever'
