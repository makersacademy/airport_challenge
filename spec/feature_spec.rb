require './lib/plane'
require './lib/airport'

airport = Airport.new
Airport::DEFAULT_CAPACITY.times { Plane.new.land(airport) }
# Plane.new.land(airport)
