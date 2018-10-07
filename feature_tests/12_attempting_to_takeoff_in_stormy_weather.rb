require_relative '0_dependencies'

puts "Airport initilaized"
puts a1 = Airport.new
puts "Plane initilaized"
puts p1 = Plane.new
puts 'weather seed set to ensure sunny'
srand(1)
puts "airport lands plane"
puts a1.land(p1)
puts 'weather seed set to ensure stormy'
srand(7)
puts "airport attempts to let plane takeoff"
puts a1.take_off(p1)
