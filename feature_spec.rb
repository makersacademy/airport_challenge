require "./lib/airport"
require "./lib/plane"

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport and confirm that it has landed

airport = Airport.new
plane = Plane.new
raise "plane did not land" unless airport.land(plane) == plane
