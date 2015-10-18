require 'plane'
require 'airport'

airport = Airport.new()
plane = Plane.new()

p "Instruct a plane to land at an airport"
plane.land(airport)

p "Instruct a plane to take off"
print "Plane #{plane}"
plane.take_off(airport)



