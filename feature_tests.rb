require './lib/airport'
require './lib/plane.rb'

airport = Airport.new
plane = Plane.new

p plane

planes = airport.planes
landed = plane.landed?

#check airport does not accept landed planes
plane.land
airport.accept(plane)
