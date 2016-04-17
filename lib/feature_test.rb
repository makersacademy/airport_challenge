require_relative 'airport'

#require 'weather'

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport and confirm that it has landed

airport = Airport.new
plane = Plane.new

airport.confirm_landing(plane)

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

airport = Airport.new
plane = Plane.new

airport.confirm_landing(plane)
airport.confirm_takeoff
