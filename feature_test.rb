require "./lib/airport.rb"
require "./lib/plane.rb"
airport = Airport.new(3)
plane = Plane.new
plane2 = Plane.new
plane3 = Plane.new
weather = false
plane.land(airport, weather)
plane2.land(airport, weather)
plane3.land(airport, weather)
plane3.take_off(airport, weather)
