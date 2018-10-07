require_relative '0_dependencies'

puts "Airport 1 initilaized"
puts a1 = Airport.new
puts "Initialize plane"
puts p1 = Plane.new
puts "Set seed to ensure sunny weather"
srand(1)
puts "Land at airport"
puts a1.land(p1)
puts "Attempt to land again"
puts a1.land(p1)
