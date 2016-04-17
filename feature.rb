require './lib/airport.rb'
require './lib/plane.rb'

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport and confirm that it has landed

airport = Airport.new
plane = Plane.new
puts airport.land(plane)

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

puts airport.take_off(plane)

# As an air traffic controller
# To ensure safety
# I want to prevent take off when weather is stormy

airport.take_off(plane)
