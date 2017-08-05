require './lib/plane.rb'
require './lib/airport.rb'

plane = Plane.new
plane2 = Plane.new

airport = Airport.new

airport.land(plane)
airport.land(plane2)

p airport

airport.ta

p airport
