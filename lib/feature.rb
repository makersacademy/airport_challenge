require_relative 'plane'
require_relative 'airport'

plane1 = Plane.new
plane2 = Plane.new
plane3 = Plane.new
plane4 = Plane.new

airport = Airport.new
airport2 = Airport.new

airport.instruct_land(plane1)
airport.instruct_land(plane2)
# p airport.planes
airport.instruct_takeoff(plane1)
# p airport.planes
airport2.instruct_land(plane1)
# p airport2.planes
airport2.instruct_takeoff(plane2)
