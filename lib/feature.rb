require_relative 'plane'
require_relative 'airport'

plane = Plane.new
airport = Airport.new

p plane
airport.instruct_land(plane)
p airport.planes
p plane.status

airport.instruct_takeoff
p airport.planes
p plane.takeoff.status
