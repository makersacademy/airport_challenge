require './lib/plane.rb'
require './lib/airport.rb'

plane = Plane.new
plane.land(airport)
airport = Airport.new
airport.land(plane)
