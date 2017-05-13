require './lib/airport.rb'
require './lib/plane.rb'

airport = Airport.new
plane = Plane.new
puts plane
plane.land(airport)
#puts airport.plane == plane
puts plane.take_off
