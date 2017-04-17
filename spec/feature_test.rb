require './lib/plane.rb'
require './lib/airport.rb'
# generates a new instances
p airport = Airport.new
p plane = Plane.new
# asks a plane to respond to the call to land with a single argument
p plane.land(airport)
# Checks that the landed plane is stored in an attribute of airport
p airport.land(plane)
p airport.aircraft

# plane responds to landed? and responds 'true' if has landed in airport
p plane.landed
p plane.landed == true
