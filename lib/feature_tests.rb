require './lib/airport'
require './lib/plane'
require './lib/weather'
airport = Airport.new
plane = Plane.new
weather = Weather.new
airport.land(plane)
airport.take_off(plane)


#I want to prevent takeoff when weather is stormy
