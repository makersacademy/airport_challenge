require './lib/plane'
plane = Plane.new
plane.landed?

require './lib/airport'
require './lib/plane'
airport = Airport.new
plane = Plane.new
airport.land(plane)
airport.take_off
