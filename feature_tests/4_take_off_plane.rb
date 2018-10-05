require './lib/airport'
require './lib/plane'

a1 = Airport.new
p1 = Plane.new
a1.land(p1)
a1.take_off(p1)
