require_relative 'plane'
require_relative 'airport'

plane1 = Plane.new
plane2 = Plane.new
plane3 = Plane.new
plane4 = Plane.new

airport = Airport.new

airport.instruct_land(plane1)
airport.instruct_land(plane2)
airport.instruct_land(plane3)
airport.instruct_land(plane4)
p airport.planes
airport.instruct_takeoff(plane)
p airport.planes



# airport.instruct_takeoff
# p storm?
# p airport.planes
# p plane.takeoff.status
