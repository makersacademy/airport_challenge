require './lib/airport'
plane = Plane.new
plane.flying?
airport = Airport.new
airport.land(plane)
airport.launch
plane.flying?
weather = Weather.new
weather.stormy?
airport.land(plane, weather)
