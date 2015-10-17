
# As an air traffic controller
# So planes can land safely at my airport
# I would like to instruct a plane to land

# airport1 = Airport.new returns airport object
# plane1 = Plane.new returrns plane object
# airport1.lands(plane1) returns plane object
require './lib/airport'
puts "new airport "
p airport1 = Airport.new
puts "new plane "
p plane1 = Plane.new
puts "airport lands plane"
p airport1.lands(plane1)

# As an air traffic controller
# So planes can take off safely from my airport
# I would like to instruct a plane to take off

# airport1.takes_off(plane1) returns plane1

puts "airport takes_off a plane"
p airport1.takes_off(plane1)

# As an air traffic controller
# So that I can avoid collisions
# I want to prevent airplanes landing when my airport if full

# airport2 = Airport.new responds with airport object with default capacity
# airport2.lands(plane1) either responds with plane object or error that airport is full.




