require_relative '../lib/airport'

airport = Airport.new
plane = Plane.new
airport.land(plane)
puts airport.planes
airport.take_off
puts airport.planes

puts airport.land(plane)