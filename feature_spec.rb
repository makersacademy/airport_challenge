puts "Welcome to the Airport Challenge Feature Test"

puts "Loading required files..."
require './lib/plane'
require './lib/airport'
require './lib/weather'
puts "Files loaded. Let's go!"

puts "Creating some objects..."
plane = Plane.new
airport = Airport.new
weather = Weather.new
puts "Objects created!"

puts "Attempting to land a plane at an airport..."
plane.land(airport, weather)
puts "... plane landed successfully"

puts "Attempting to instruct a plane to take off..."
plane.take_off(weather)
puts "... plane has taken off successfully!"

puts "Attempting to confirm plane is no longer in the airport"
airport.hangar
puts "... confirmed plane no longer in the airport!"

puts "Attempting to instruct a plane to take off when it's not at an airport. Should fail"
puts plane.take_off(weather)
puts "... failed, as desired!"

puts "Setting up an airport that's full..."
airport.capacity.times { Plane.new.land(airport, weather) }
put "Airport now full."

puts "Attempting to land a plane in the airport that is full..."
plane.land(airport, weather)
puts "... failed, as desired!"

puts "Attempting to override default capacity of the airport"
airport.set_capacity(30)
puts "Airport capacity successfully updated!"

puts "Attempting to create a new airport with a custom capacity"
a_smaller_airport = Airport.new(3)
puts "New airport with a custom capacity successfully created"

puts "Run take-offs and landing multiple times to see stormy weather preventing completion"
10.times { Plane.new.land(airport, weather) }
airport.hangar.each { |plane| plane.take_off(weather) }
puts "Some planes are taking off and landing, others not because of weather"
