require_relative '../lib/airport'

airport = Airport.new
plane = Plane.new
airport.land(plane)
puts airport.planes
airport.take_off
puts airport.planes
50.times {airport.land(plane)}
puts airport.land(plane)