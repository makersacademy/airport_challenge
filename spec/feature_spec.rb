require './lib/plane'
require './lib/airport'


#puts "First feature test: As an air traffic controller
#So planes can land safely at my airport
#I would like to instruct a plane to land"

p plane = Plane.new
p plane.land

#puts "--------------"

# puts "Second feature test: As an air traffic controller
# So planes can take off safely from my airport
# I would like to instruct a plane to take off"

p plane.takeoff

#puts "--------------"

# puts "Third feature test: As an air traffic controller
# So that I can avoid collisions I want to prevent 
# airplanes landing when my airport if full"

p airport = Airport.new
p airport.host(plane)

#puts "--------------"

