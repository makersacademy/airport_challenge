require_relative '0_dependencies'

puts "Airport initilaized"
puts  a1 = Airport.new
puts "Plane initilaized"
puts p1 = Plane.new
puts "weather seed set to ensure sunny"
srand(1)
puts "plane lands"
puts a1.land(p1)
puts "plane takes off"
puts a1.take_off(p1)
