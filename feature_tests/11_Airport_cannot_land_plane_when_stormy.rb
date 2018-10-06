require './lib/airport'
require './lib/weather'
require './lib/plane'

puts "Airport initilaized"
puts  a1 = Airport.new
puts "Plane initilaized"
puts  p1 = Plane.new
puts 'weather seed set so that it sunny'
srand(7)
puts "airport trys to land plane"
puts  a1.land(p1)
