require_relative '0_dependencies'

puts "Airport initilaized"
puts  a1 = Airport.new
puts "Plane initilaized"
puts p1 = Plane.new
puts "check if plane is in hanger"
puts a1.in_hanger?(p1)
