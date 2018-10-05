require './lib/airport'
require './lib/plane'

a1 = Airport.new
p1 = Plane.new
a1.in_hanger?(p1)
