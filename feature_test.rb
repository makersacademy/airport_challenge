# feature_test
require './lib/airport'

puts airport = Airport.new
puts
puts 5.times { airport.land(Plane.new) }
