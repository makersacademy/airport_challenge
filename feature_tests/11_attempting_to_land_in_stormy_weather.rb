require_relative '0_dependencies'

puts "Airport initilaized"
puts  a1 = Airport.new
puts "Plane initilaized"
puts  p1 = Plane.new
puts 'weather seed set to ensure stormy'
srand(7)
puts "airport trys to land plane"
puts  a1.land(p1)
