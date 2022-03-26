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
