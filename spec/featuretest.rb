require './lib/airport'

airport = Airport.new
plane_1 = Plane.new
plane_2 = Plane.new

airport.land(plane_1)
airport.land(plane_2)

airport.plane_take_off
p "planes: #{airport.planes}"
