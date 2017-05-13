require './lib/airport.rb'
require './lib/plane.rb'

airport = Airport.new
plane = Plane.new
plane.land(airport)
puts airport.plane == plane
