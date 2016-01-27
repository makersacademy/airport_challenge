require 'airport'

describe 'These are all the user stories' do

# # As an air traffic controller 
# # So I can get passengers to a destination 
# # I want to instruct a plane to land (at an airport and confirm that it has landed)

	it 'so planes land at airport, instruct a plane to land'  do
		airport = Airport.new(20)
		plane = Plane.new
		allow(airport).to receive(:stormy?).and_return false
		expect{airport.land(plane)}.not_to raise_error 
	end

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

	it 'so planes take off from airport, instruct a plane to take off' do
		airport = Airport.new(20)
		plane = Plane.new
		expect{airport.taken_off(plane)}.not_to raise_error
	end

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 
	context 'when airport is full' do

		it 'does not allow planes to land' do
			airport = Airport.new(20)
			plane = Plane.new
			allow(airport).to receive(:stormy?).and_return false
				20.times do 
				airport.land(plane)
				end
			expect{airport.land(plane)}.to raise_error 'Cannot land plane: airport full.  Take off a plane first.'
		end	
	end

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 

	context 'when weather is stormy' do

		it 'does not allow planes to land' do
			airport = Airport.new(20)
			plane = Plane.new
			allow(airport).to receive(:stormy?).and_return false
			expect{airport.land(plane)}.to raise_error 'Cannot land plane: weather is stormy.'
		end
	end

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

end

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate