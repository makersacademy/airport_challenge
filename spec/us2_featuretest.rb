require './lib/software_airport'

# create envirionment for test: airport, plane, etc
puts "create two 'airports'"
source = Airport.new
destination = Airport.new

puts "Create a 'plane'"
plane = Plane.new

# feature testing requirements
puts "Test the ability to list airports"
puts Airport.list_airports

puts "Test the ability to list the planes at an airport"
puts source.list_planes

puts "Test the ability to assign a destination to a plane"
plane.destination = destination
puts plane.destination

puts "Test the ability to instruct a plane to take_off"
plane.take_off
puts "#{plane} is #{plane.status} on way to #{plane.destination}"

puts "completion of feature testing if outputs are appropriate"
