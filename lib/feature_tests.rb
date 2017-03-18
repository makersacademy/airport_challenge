require './lib/airport'
require './lib/plane'
airport = Airport.new
plane = Plane.new
airport.land(plane)
plane.flying?


#planes can only take off from airports they are in
