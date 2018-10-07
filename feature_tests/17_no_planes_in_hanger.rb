require_relative '0_dependencies'

puts "Airport initilaized with capcity of 5"
puts  a1 = Airport.new(5)

3.times do
  puts "set seed to ensure sunny"
  srand(1)
  puts "Land a new plane"
  puts a1.land(Plane.new)
end

puts "check number of planes in hanger"
puts a1.no_in_hanger
