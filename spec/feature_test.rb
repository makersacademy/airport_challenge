require './lib/airport'
require './lib/plane'

airport = Airport.new
airport.is_full?

plane = Plane.new
plane.land(airport)