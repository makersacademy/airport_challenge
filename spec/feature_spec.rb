require './lib/airport'

airport1 = Airport.new
airport2 = Airport.new

plane1 = Plane.new
plane2 = Plane.new
plane3 = Plane.new
plane4 = Plane.new
plane5 = Plane.new
plane6 = Plane.new
#
# airport1.land_plane(plane1)
# airport1.land_plane(plane2)
# airport1.land_plane(plane3)
#
# airport2.land_plane(plane4)
# airport2.land_plane(plane5)
# airport2.land_plane(plane6)
#
# airport1.depart_plane(plane1)
# airport2.depart_plane(plane2)
# airport1.depart_plane(plane4)
# airport1.depart_plane(plane6)


puts "These are the planes that are in airport 1 #{airport1.list}."
puts "These are the planes that are in airport 2 #{airport2.list}."
