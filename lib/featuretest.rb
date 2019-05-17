require_relative 'airport'
require_relative 'plane'

airport = Airport.new
plane = Plane.new

puts airport.planes
puts "------------------"
airport.land(plane)
airport.land(plane)
airport.land(plane)
puts airport.planes
puts "------------------"
@planes.pop
puts airport.planes
