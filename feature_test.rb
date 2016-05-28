require './lib/airport.rb'
require './lib/plane.rb'

airport = Airport.new
plane = Plane.new
plane.on_ground
airport.planes
plane.take_off
plane.on_ground
airport.planes
