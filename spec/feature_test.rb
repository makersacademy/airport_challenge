require './lib/airport'
require './lib/plane'
require './lib/weather'

airport = Airport.new
airport.is_full?
weather = Weather.new

plane = Plane.new

airport.take_off(plane)
airport.land(plane)

