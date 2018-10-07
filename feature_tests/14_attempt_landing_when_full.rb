require_relative '0_dependencies'

puts "Airport initilaized"
puts a1 = Airport.new

a1.capacity.times do
  puts "Check if airport full"
  puts a1.full?
  puts "set seed to ensure sunny"
  srand(1)
  puts "Land a new plane"
  puts a1.land(Plane.new)
end

puts "check if airport is full"
puts a1.full?
puts 'Set seed to esnure sunny'
srand(1)
puts 'Attempt to land one more plane'
puts a1.land(Plane.new)
