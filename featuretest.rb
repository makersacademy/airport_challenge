require './lib/airport.rb'
require './lib/plane.rb'

airport = Airport.new
airport2 = Airport.new
plane = Plane.new
plane2 = Plane.new

airport.land(plane)
airport.land(plane2)
airport.take_off(plane)
puts airport.planes
#airport.take_off(plane)

airport.land(plane)
airport.take_off(plane)
airport2.land(plane)
airport2.take_off(plane)
