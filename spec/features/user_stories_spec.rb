require 'airport'

describe 'These are all the user stories' do

# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land #(at an airport and confirm that it has landed)

	it 'so planes land at airport, instruct a plane to land'  do
		airport = Airport.new
		plane = Plane.new
		expect{airport.land(plane)}.not_to raise_error #null test
	end

# As an air traffic controller 
# So planes can take off safely from my airport"
# I would like to instruct a plane to take off"

	it 'so planes take off from airports, instruct a plane to take off' do
		airport = Airport.new
		plane = Plane.new
		expect{airport.take_off(plane)}.not_to raise_error 
	end
end

## ?? ## I want to code 'instruct - by whom to whom' and 'safely - some measure' and 'from an airport'...!!