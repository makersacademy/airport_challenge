require './lib/plane'
require './lib/airport'


#puts "First feature test: As an air traffic controller
#So planes can land safely at my airport
#I would like to instruct a plane to land"

# p plane = Plane.new
# p airport = Airport.new
# p airport.land(plane)

#puts "--------------"

# puts "Second feature test: As an air traffic controller
# So planes can take off safely from my airport
# I would like to instruct a plane to take off"

# p airport.take_off(plane)

#puts "--------------"

# puts "Third feature test: As an air traffic controller
# So that I can avoid collisions I want to prevent 
# airplanes landing when my airport if full"

# 50.times { airport.land(plane) } #the airport is now full
# p airport.planes_array.length

#puts "--------------"

# puts "4th user story: As an air traffic controller
# So that I can avoid accidents I want to prevent airplanes 
# landing or taking off when the weather is stormy"

# if a method 'stormy' returning true or false randomly, 
# these two methods will throw an error.
# p airport.land(plane)
# p airport.take_off

#puts "--------------"

# puts "5th user story: As an air traffic controller
# So that I can ensure safe take off procedures
# I want planes only to take off from the airport they are at"

# p plane = Plane.new
# p plane2 = Plane.new
# p airport = Airport.new
# p airport2 = Airport.new

# p airport.land(plane2)

# p airport.take_off(plane)
# p airport.take_off(plane2)

#puts "--------------"

# puts "6th user story: As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate"

# p airport = Airport.new(100)

#puts "--------------"

# puts "7th user story: As an air traffic controller
# So the system is consistent and correctly reports plane status and location
# I want to ensure a flying plane cannot take off and cannot be in an airport"

# p plane = Plane.new
# p airport = Airport.new
# p plane2 =Plane.new

# p airport.land(plane)
# p airport.take_off(plane)
# p airport.take_off(plane2)