require_relative '0_dependencies'

puts "Airport initilaized"
puts  a1 = Airport.new

a1.capcity.times do
  puts "Check if airport full"
  puts  a1.full?
  puts "set seed to ensure sunny"
  srand(1)
  puts "Land a new plane"
  puts a1.land(Plane.new)
end

puts "check if airport is full"
puts a1.full?
