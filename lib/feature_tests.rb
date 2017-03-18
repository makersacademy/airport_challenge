require './lib/airport'
require './lib/plane'
airport = Airport.new
plane = Plane.new
airport.land(plane)
airport.take_off(plane)


#I want to prevent takeoff when weather is stormy
