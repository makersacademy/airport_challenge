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
