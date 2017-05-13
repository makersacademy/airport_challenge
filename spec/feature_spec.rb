require './lib/airport'
require './lib/plane'

p airport = Airport.new
p plane = Plane.new
p airport.land_plane(plane)
p airport.takeoff_plane(plane)
p plane.airborne?
