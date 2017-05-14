require './lib/airport.rb'
require './lib/plane.rb'

airport = Airport.new
plane = Plane.new
airport.land(plane)
plane2 = Plane.new
airport.land(plane2)
airport.take_off(plane)
puts airport.planes
#airport.take_off(plane)
