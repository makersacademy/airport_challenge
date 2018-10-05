require './lib/airport.rb'
require './lib/plane.rb'
airport = Airport.new
plane = Plane.new
airport.land(plane)
airport.takeoff(plane)
airport.statuscheck
airport.prevent_takeoff
airport.check_weather
airport.prevent_landing
airport.check_capacity
airport.set_capacity
