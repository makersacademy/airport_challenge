#not feeling overly confident about how to write feature tests. Would appreciate feedback/guidance on how to improve this

require 'airport'

airport = Airport.new
p airport.capacity
plane_BA = Plane.new
plane_ryanair = Plane.new
plane_easyjet = Plane.new
airport.land(plane_BA)
airport.land(plane_easyjet)
airport.depart

airport_small = Airport.new(10)
airport_small.capacity #should return 10
plane_a = Plane.new
plane_b = Plane.new
airport.land(plane_a)
airport.land(plane_b)
airport.depart
