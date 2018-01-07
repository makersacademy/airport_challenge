require './lib/airport'
require './lib/plane'

airport = Airport.new
plane1 = Plane.new
plane2 = Plane.new
airport.land(plane1)
plane1.landed
airport.land(plane2)
plane2.landed
airport.planes
plane1.status
plane2.status
