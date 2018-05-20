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
# puts "Create an instance of an aiport:"
# p airport = Airport.new
# puts "Create an instance of a plane:"
# p plane = Plane.new
# puts "Instruct a plane to take off and get confirmation"
# p airport.take_off(plane)

# ** User Story 3 **
# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy

# ** Feature Test 3 **
# puts "Create an instance of an aiport:"
# p airport = Airport.new
# puts "Create an instance of a plane:"
# p plane = Plane.new
# puts "Return error if the weather is stormy, and no planes leave,"
# puts "or if sunny, a plane will take off:"
# p airport.take_off(plane)

# ** User Story 4 **
# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy

# ** Feature Test 4 **
# puts "Create an instance of an aiport:"
# p airport = Airport.new
# puts "Create an instance of a plane:"
# p plane = Plane.new
# puts "Return error if the weather is stormy, and no planes land,"
# puts "or if sunny, a plane will be able to land:"
# p airport.land(plane)

# ** User Story 5 **
# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full

# ** Feature Test 5 **
puts "Create an instance of an aiport:"
p airport = Airport.new
puts "Create an instance of a plane:"
p plane = Plane.new
puts "Land a first plane:"
p airport.land(plane)
puts "Create another instance of a plane:"
p plane = Plane.new
puts "Return error if airport is full, and no further planes can land,"
puts "or if airport is less than full, a plane will be able to land:"
p airport.land(plane)
