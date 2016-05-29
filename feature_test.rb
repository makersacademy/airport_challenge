require './lib/airport.rb'
require './lib/plane.rb'

airport = Airport.new
plane = Plane.new
p plane.land(airport)
airport.set_capacity(1)
# plane2 = Plane.new
# p airport.capacity
# p plane.land(airport)
# p airport.planes

# plane.take_off
# airport.set_capacity(1)
# airport.accept_plane(plane)
