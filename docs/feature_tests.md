
US1
airport = Airport.new
airport.land(plane)

US2
plane = Plane.new
airport = Airport.new
airport.land(plane)
airport.take_off(plane)
airport.planes

US3
plane = Plane.new
airport = Airport.new
airport.take_off(plane)
Error: Bad weather conditions!

US4
plane = Plane.new
airport = Airport.new
airport.land(plane)
Error: Bad weather conditions!

US5
airport = Airport.new
plane = Plane.new
200.times { airport.land(plane) }
airport.land(plane)
Error: No landing slots available!

US6
plane = Plane.new
airport_1 = Airport.new
airport_1.capacity = 200
airport_2 = Airport.new
airport_2.capacity = 1000
