require "./lib/airport.rb"
require "./lib/plane.rb"
airport = Airport.new
plane = Plane.new
weather = airport.good_weather?
plane.land(airport, weather)
plane.take_off(airport, weather)
