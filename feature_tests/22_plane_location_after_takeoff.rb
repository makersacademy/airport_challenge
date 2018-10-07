require_relative '0_dependencies'

puts "airport initilaized"
puts a1 = Airport.new
puts "Plane initilaized"
puts p1 = Plane.new
puts "weather seed set to ensure sunny"
srand(1)
puts "Land plane"
puts a1.land(p1)
puts "Check location"
puts p1.location
puts "weather seed set to ensure sunny"
srand(1)
puts "Plane takes off"
puts a1.take_off(p1)
puts "Check location"
puts p1.location
