require './lib/airport'
require './lib/plane'

puts airport = Airport.new
puts plane = Plane.new
puts airport.land plane
puts airport.planes
puts airport.take_off plane
puts airport.planes
