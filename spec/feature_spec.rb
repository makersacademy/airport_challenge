require_relative '../lib/plane'
require_relative '../lib/airport'

plane = Plane.new
airport = Airport.new

# plane.take_off
# plane.land
# plane.flying?

p plane
p airport
p airport.land(plane)
p airport.take_off
