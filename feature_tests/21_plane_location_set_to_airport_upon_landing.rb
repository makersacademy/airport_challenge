require_relative '0_dependencies'

puts "airport initilaized"
puts a1 = Airport.new
puts "Plane initilaized"
puts p1 = Plane.new
puts "weather seed set to ensure sunny"
srand(1)
puts "Land plane"
puts a1.land(p1)
puts "check location"
puts p1.location
