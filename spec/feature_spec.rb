require 'plane'
require 'airport'

print 'makes a new plane: '
puts plane = Plane.new #=> <Plane:0x007fcd9a84f728>

print 'makes a new airport: '
puts airport = Airport.new #=> <Airport:0x007f8fc88a5570>

print 'let a plane #land at an airport: '
puts airport.land(plane) #=> <Plane:0x007fcd9a84f728>

print 'check if the airport has the landed plane: '
puts airport.plane #=> <Plane:0x007fcd9a84f728>

print 'check if the plane is landed: '
puts plane.landed? #=> true

print 'make a plane #take_off from an airport: '
#puts  airport.take_off #=> <Plane:0x007fcd9a84f742>
