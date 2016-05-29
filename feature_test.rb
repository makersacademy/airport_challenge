require './lib/airport.rb'
require './lib/plane.rb'

airport = Airport.new
plane = Plane.new
p plane.land(airport)
plane.take_off
# airport.set_capacity(1)
# airport.accept_plane(plane)
