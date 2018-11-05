require './lib/airport'

airport = Airport.new
plane = Plane.new
airport.land(plane)

puts airport.capacity
