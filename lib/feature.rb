require_relative 'plane'
require_relative 'airport'
require_relative 'weather'

plane = Plane.new
airport = Airport.new

airport.instruct_land(plane)
airport.instruct_takeoff
p airport.planes



# airport.instruct_takeoff
# p storm?
# p airport.planes
# p plane.takeoff.status
