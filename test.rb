require './lib/airport.rb'
require './lib/plane.rb'

airport = Airport.new
plane = Plane.new
airport.weather_is_stormy = false
puts plane.land(airport)
