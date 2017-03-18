require './lib/airport'
require './lib/plane'
airport = Airport.new
plane = Plane.new
airport.land(plane)
plane.flying?


#if plane is in airport, should not be flying
