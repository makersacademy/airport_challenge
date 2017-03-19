require './lib/airport'
require './lib/plane'
require './lib/weather'
airport = Airport.new
plane = Plane.new
airport.land(plane)
airport.take_off(plane)
