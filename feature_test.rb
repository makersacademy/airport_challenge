require './lib/plane.rb'
require './lib/airport.rb'
require './lib/weather.rb'

plane = Plane.new
# plane2 = Plane.new
# plane3 = Plane.new

airport = Airport.new(2)
# weather = Weather.new

airport.land(plane)

airport.take_off(plane)

# airport.land(plane)
# airport.land(plane2)
#
# p airport
#
# p airport.land(plane3)

# p airport
# p airport.take_off(plane2)
