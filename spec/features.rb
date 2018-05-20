require './lib/airport.rb'

# ** User Story 1 **
# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

# ** Feature Test 1 **
# puts "Create an instance of an aiport:"
# p airport = Airport.new
# puts "Create an instance of a plane:"
# p plane = Plane.new
# puts "Land a plane at the airport"
# p airport.land(plane)

# ** User Story 2 **
# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

# ** Feature Test 2 **
puts "Create an instance of an aiport:"
p airport = Airport.new
puts "Create an instance of a plane:"
p plane = Plane.new
puts "Instruct a plane to take off and get confirmation"
p airport.take_off(plane)
