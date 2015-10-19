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

#feature test 5: checks plane was grounded at the airport
airport1 = Airport.new
airport2 = Airport.new
airport1.land(plane)
airport2.take_off(plane)

#feature test 6: variable capacity for airport
airport = Airport.new(20)
20.times airport.land(Plane.new)
airport.land (Plane.new)
airport.capacity = 30
10.times airport.land(Plane.new)
airport.land(Plane.new)

#feature test 7: planes that are flying or not in the airport cannot take off
airport = Airport.new
plane = Plane.new
airport.land(plane)
airport.take_off(plane)
airport.take_off(plane)

#feature test 8: planes that are not flying cannot land must be in an airport
airport = Airport.new
plane = Plane.new
airport.land(plane)
airport.land(plane)

#feature test 9: planes that take-off from the airport are no longer in the hanger
airport = Airport.new
plane = Plane.new
airport.land(plane)
airport.hangar
airport.take_off(plane)
airport.hangar