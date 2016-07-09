require 'plane'
require 'airport'

# ### user stories 1 and 2:
# plane = Plane.new
airport = Airport.new
# 2.times {airport.land(plane)}
# airport.planes
# airport.take_off(plane)
# airport.planes
#
# ### edge cases: taking off from a different airport should raise an error
# plane1 = Plane.new
# airportA = Airport.new
# airportB = Airport.new
# airportA.land(plane1)
# airportB.take_off(plane1)

### edge cases: taking off if you are already in the air should raise an Error
plane2 = Plane.new
airport.land(plane2)
# airport.take_off(plane2)
puts"#{plane2.location}"
# airport.take_off(plane2)
