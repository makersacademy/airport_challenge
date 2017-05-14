require 'plane'
require 'airport'
require 'weather'

print 'makes a new plane: '
p plane = Plane.new #=> <Plane:0x007fcd9a84f728>

print 'makes a new airport: '
p airport = Airport.new #=> <Airport:0x007f8fc88a5570>

print 'let a plane #land at an airport: '
p plane.land(airport) #=> <Plane:0x007fcd9a84f728>

print 'check if the airport has the landed plane: '
p airport.planes #=> [<Plane:0x007fcd9a84f728>]

print 'check if the plane is landed: '
p plane.landed #=> true

print 'make the plane #take_off from an airport: '
p plane.take_off(airport) #=> false

print 'confirm that the plane is no longer in the airport: '
p airport.planes #=> []

#print 'raise error if no planes available to take off: '
# airport.take_off #=> Error 'No planes currently available'

print 'the plane is no longer #landed after taking off: '
p plane.landed #=> false

print 'creates a new weather: '
p weather = Weather.new #=> <Weather:0x007f84d70ef048>

print 'generates a random number 1-10: '
p weather.random #=> 2
