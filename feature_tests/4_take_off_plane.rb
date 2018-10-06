require './lib/airport'
require './lib/plane'
srand(1)

puts "Airport initilaized"
puts  a1 = Airport.new
puts "Plane initilaized"
puts p1 = Plane.new
puts "plane lands"
puts a1.land(p1)
puts "plane takes off"
puts a1.take_off(p1)
