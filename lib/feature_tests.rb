require './lib/airport'
require './lib/plane'
airport = Airport.new
airport2 = Airport.new
plane = Plane.new
airport.land(plane)
airport2.take_off(plane)
plane.flying?


#planes can only take off from airports they are in
