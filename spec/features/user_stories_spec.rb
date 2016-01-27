require 'airport'

describe 'These are all the user stories' do

# # As an air traffic controller 
# # So I can get passengers to a destination 
# # I want to instruct a plane to land (at an airport and confirm that it has landed)

	it 'so planes land at airport, instruct a plane to land'  do
	airport = Airport.new
	plane = Plane.new
	expect{airport.land(plane)}.not_to raise_error 
	end

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

	it 'so planes take off from airport, instruct a plane to take off' do
	airport = Airport.new
	plane = Plane.new
	expect{airport.taken_off(plane)}.not_to raise_error
	end
end

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate