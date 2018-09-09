irb
require './lib/airport.rb'
 airport = Airport.new
 plane = Plane.new
 airport2 = Airport.new
 plane2 = Plane.new
 airport.land(plane)
 airport.land(plane2)
 airport2.take_off(plane2)
 plane3 = Plane.new
 airport2.land(plane3)
 airport2.take_off(plane2)
exit
