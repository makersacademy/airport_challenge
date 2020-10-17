require './lib/software_airport'

=begin
User story 2 -
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
=end

# create envirionment for test: airport, plane, etc
puts "create two 'airports'"
source = Airport.new
destination = Airport.new

puts "Create a 'plane'"
plane = Plane.new

# feature testing requirements
puts "Test the ability to list airports"
puts "#{Airport.list_all_airports}"

puts "Test the ability to list the planes at an airport"
puts "#{Plane.list_all_planes.select { |airplane| airplane.location = source }}"

puts "Test the ability to assign a destination to a plane"
plane.destination = destination
puts "#{plane.destination}"

puts "Test the ability to instruct a plane to take_off"
plane.take_off
puts "#{plane} is #{plane.status} on way to #{plane.destination}"

puts "completion of feature testing if outputs are appropriate"
