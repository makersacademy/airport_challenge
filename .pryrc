require './lib/plane'
require './lib/weather'
require './lib/airport'
airport = Airport.new
@plane = Plane.new
airport.land(@plane)
