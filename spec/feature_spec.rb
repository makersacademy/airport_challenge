require './lib/airport'

airport = Airport.new
plane = Plane.new
airport.land_plane(plane)
p airport
