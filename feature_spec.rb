require "./lib/airport"
require "./lib/plane"

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport and confirm that it has landed

airport = Airport.new
plane = Plane.new
# raise "plane did not land" unless airport.land(plane) == plane
raise "plane landing wasn't confirmed" unless airport.land(plane) == [plane]
# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

raise "plane did not take off" unless airport.take_off(plane) == plane

airport.take_off(plane)
raise "plane took off but is still in the airport" unless airport.planes == []

empty_airport = Airport.new
plane2 = Plane.new
raise "airport does not start empty" unless empty_airport.planes == []
empty_airport.take_off(plane2)
raise "Airport allows non-existent plane to take off" if empty_airport.planes == []
