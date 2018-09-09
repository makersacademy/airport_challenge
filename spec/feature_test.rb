# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

load './lib/airport.rb'
load './lib/plane.rb'
airport = Airport.new
plane = Plane.new
airport.land(plane)
