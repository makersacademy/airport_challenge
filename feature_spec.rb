puts "Welcome to the Airport Challenge Feature Test"

puts "Loading required files..."
require './lib.plane'
require './lib.airport'
puts "Files loaded. Let's go!"

puts "Creating some objects..."
plane = Plane.new
airport = Airport.new
puts "Objects created!"

puts "Attempting to land a plane at an airport..."
plane.land(airport)
puts "... plane landed successfully"

puts "Attempting to instruct a plane to take off..."
plane.take_off
puts "... plane has taken off successfully!"

puts "Attempting to confirm plane is no longer in the airport"
airport.hangar
puts "... confirmed plane no longer in the airport!"

puts "Attempting to instructor a plane to take off when it's not at an airport. Should fail"
plane.take_off
puts "... failed, as desired!"

puts "Setting up an airport that's full..."
airport.capacity.times { Plane.new.land(airport) }
put "Airport now full."

puts "Attempting to land a plane in the airport that is full..."
plane.land(airport)
puts "... failed, as desired!"

puts "Attempting to override default capacity of the airport"
airport.set_capacity(5)
puts "Airport capacity successfully updated!"

puts "Attempting to create a new airport with a custom capacity"
a_smaller_airport = Airport.new(3)
puts "New airport with a custom capacity successfully created"
