require './lib/software_airport'

=begin
User story 3 -
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
=end

# create envirionment for test: airport, plane, etc
puts "create destination 'airport'"
dest_airport = Airport.new ('Test')

puts "Create a 'plane' and setup ready to land"
test_plane = Plane.new
test_plane.location = 'in_air'
test_plane.destination = dest_airport

# feature testing requirements
puts "request plane to land at allocated destination - not full"
puts "#{test_plane.location}"
puts "#{test_plane.land}"
puts "#{test_plane.location}"

# feature testing requirements
dummy_plane = Plane.new
dummy_plane.location = dest_airport
dest_airport.capacity = 1

test_plane.location = 'in_air'
test_plane.destination = dest_airport
puts "request plane to land at allocated destination - full"
puts "#{test_plane.location}"
puts "#{test_plane.land}"
puts "#{test_plane.location}"

puts "if plane is still in_air, then US3 has been met"
