require './lib/airport.rb'
require './lib/plane.rb'
airport = Airport.new
plane = Plane.new
airport.land(plane)
airport.takeoff(plane)
airport.statuscheck(plane)
airport.prevent_takeoff(plane)
airport.check_weather(airport)
airport.prevent_landing(plane)
airport.check_capacity(airport)
airport.set_capacity(airport)
