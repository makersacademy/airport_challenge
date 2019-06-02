# feature_test
require './lib/airport'

puts airport = Airport.new
puts
puts 6.times { airport.land(Plane.new) }
