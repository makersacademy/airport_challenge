require_relative '0_dependencies'

puts "Airport 1 initilaized"
puts a1 = Airport.new
puts "Airport 2 initilaized"
puts a2 = Airport.new
puts "Initialize plane"
puts p1 = Plane.new
puts "Set seed to ensure sunny weather"
srand(1)
puts "Land at airport 1"
puts a1.land(p1)
puts "Attempt landing at airport 2"
puts a2.land(p1)
