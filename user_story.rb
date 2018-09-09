
require './lib/airport.rb'
airport = Airport.new
plane = Plane.new
plane = airport.land(plane)
plane.take_off
is_weather_stormy = airport.check_weather
