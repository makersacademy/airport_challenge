require_relative '0_dependencies'

puts "Airport initilaized"
puts a1 = Airport.new
puts "Initialize plane"
puts p1 = Plane.new
puts "Attemp takeoff of plane not at airport"
puts a1.take_off(p1)
