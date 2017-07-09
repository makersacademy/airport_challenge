require './lib/airport'
require './lib/plane'

airport = Airport.new
plane = Plane.new

airport.land_plane(plane)
p airport.land
