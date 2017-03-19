require './lib/airport'
plane = Plane.new
plane.functioning?
airport = Airport.new
airport.land(plane)
airport.planes
airport.launch
weather = Weather.new
weather.stormy?
badweather = Weather.new(9)
badweather.stormy?
