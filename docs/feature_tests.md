
US1-2
plane = Plane.new
airport = Airport.new
airport.land(plane)
airport.take_off(plane)
airport.planes

US6
plane = Plane.new
airport_gatwick = Airport.new(120)
airport_gatwick.capacity ---> 120
airport_luton = Airport.new
airport_luton.capacity ----> 100
