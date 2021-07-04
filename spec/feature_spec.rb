require './lib/plane'
require './lib/airport'

plane_1 = Plane.new
plane_2 = Plane.new
airport = Airport.new
plane_1.land(airport)
plane_1.take_off
plane_2.land(airport)
