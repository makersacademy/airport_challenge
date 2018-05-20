require './lib/airport.rb'

# ** User Story 1 **
# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

puts "Create an instance of an aiport:"
p airport = Airport.new
puts "Create an instance of a plane:"
p plane = Plane.new
puts "Land a plane at the airport"
p airport.land(plane)
