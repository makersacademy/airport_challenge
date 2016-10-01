require './lib/airport'
require './lib/plane'
gatwick = Airport.new
heathrow = Airport.new
plane1 = Plane.new
plane2 = Plane.new
gatwick.land_plane(plane1)
heathrow.land_plane(plane2)
