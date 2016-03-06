require './lib/airport'
require './lib/plane.rb'

airport = Airport.new
plane = Plane.new

planes = airport.planes
landed = plane.landed?

airport.land(plane)

p plane.landed?
