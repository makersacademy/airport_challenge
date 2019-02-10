require "./lib/airport.rb"
require "./lib/plane.rb"

plane = Plane.new
airport = Airport.new
airport.land(plane)
airport.weather("stormy")
airport.take_off(plane)
airport.is_here?(plane)

plane2 = Plane.new
airport2 = Airport.new
airport2.weather("stormy")
airport2.land(plane2)

plane3 = Plane.new
airport.weather("clear")
airport.land(plane3)

airport3 = Airport.new(10)
airport3.capacity
