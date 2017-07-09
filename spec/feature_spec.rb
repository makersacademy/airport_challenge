=begin
require './lib/airport'
require './lib/plane'

airport = Airport.new
plane = Plane.new

airport.land(plane)
p airport.land
=end
