require './lib/airport'

airport = Airport.new

plane1 = Plane.new
plane2 = Plane.new
plane3 = Plane.new

airport.land_plane(plane1)
airport.land_plane(plane2)
airport.land_plane(plane3)

airport.depart_plane(plane1)
airport.depart_plane(plane2)
airport.depart_plane(plane3)
