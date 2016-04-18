require "./lib/airport"
require "./lib/plane"
require "./lib/weather"

airport = Airport.new
plane = Plane.new

fail "plane did not land" unless airport.land(plane) == plane
fail "plane landing wasn't confirmed" unless airport.land(plane) == [plane]
fail "plane did not take off" unless airport.take_off(plane) == plane

airport.take_off(plane)
fail "plane took off but is still in the airport" unless airport.planes == []

empty_airport = Airport.new
fail "airport does not start empty" unless empty_airport.planes == []
empty_airport.take_off(plane)
fail "Airport allows non-existent plane to take off" if empty_airport.planes == []

weather = Weather.new
fail "Object responded weirdly" unless weather.new_day == "Stormy" || "Sunny"
fail "Plane took off in stormy weather" if airport.take_off(plane) == []
fail "Returned false when sunny" if airport.safe == false

plane = Plane.new
5.times(airport.land(plane))
fail "Airport does not know when full" if airport.land(plane)
