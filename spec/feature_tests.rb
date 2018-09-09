require './lib/airport'
airport = Airport.new
plane = Plane.new
airport.land(plane)
airport.take_off(plane)
airport.planes?

airport.capacity?
p DEFAULT_CAPACITY
