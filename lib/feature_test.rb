require './lib/plane'
require './lib/airport'
require './lib/weather'


plane1 = Plane.new
plane2 = Plane.new
airport = Airport.new(5)

airport.land(plane1, false)
airport
airport.land(plane1, false)
