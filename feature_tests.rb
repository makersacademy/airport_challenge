#Test that Plane class exists
plane = Plane.new
#Test for Airport class
airport = Airport.new
#feature test 1 - plane lands at airport
airport.land(plane)

#feature test 2 - plane takes off from airport
airport.take_off(plane)

#feature test 3: full airport safety feature
30.times {airport.land(Plane.new)}
airport.land(Plane.new)

#feature test 4: stormy weather safety feature
airport = Airport.new
grounded_plane = Plane.new
airport.land(grounded_plane)
flying_plane = Plane.new
airport.cloud_seeding
aiport.take_off(grounded_plane)
airport.land(flying_plane)

#

#feature test 6: variable capacity for airport
airport = Airport.new(20)
20.times airport.land(Plane.new)
airport.land (Plane.new)
airport.capacity = 30
10.times airport.land(Plane.new)
airport.land(Plane.new)
