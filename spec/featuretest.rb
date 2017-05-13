require './lib/airport'

airport = Airport.new
plane_1 = Plane.new
plane_2 = Plane.new

p airport.land(plane_1)
p airport.land(plane_2)

p "planes: #{airport.planes}"
