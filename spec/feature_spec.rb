require './lib/airport'
require './lib/plane'
require './lib/weather'

p airport = Airport.new
p airport1 = Airport.new
p plane1 = Plane.new
p plane2 = Plane.new
p plane3 = Plane.new
p airport.land_plane(plane1)
p airport.land_plane(plane2)
p airport.land_plane(plane3)
p airport.check_hangar
p airport1.check_hangar
