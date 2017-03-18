require './lib/airport'
require './lib/plane'
airport = Airport.new
plane = Plane.new
airport.capacity.times {airport.planes_in_airport << plane}
