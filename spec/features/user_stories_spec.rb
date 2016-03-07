describe 'User Stories' do
	let(:airport) { Airport.new(20) }
	let(:plane) { Plane.new }

#1. As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport and confirm that it has landed

it 'planes need to land at airports, instructs planes to land at airport' do
	allow(airport).to receive(:stormy?).and_return false
  	expect { airport.land(plane)}.not_to raise_error
end


#2. As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

it 'i want to instruct a plane to take off from an airport' do
	expect { airport.take_off(plane).not_to raise_error }
end

#3. As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full

it 'i want to stop planes landing when the airport is full' do
	allow(airport).to receive(:stormy?).and_return false
	20.times do 
	airport.land(plane)
end
	expect { airport.land(plane) }.to raise_error 'Airport full, cannot land plane'
end


#4.1 As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy

context 'when weather is stormy' do
	before do
		allow(airport).to receive(:stormy?).and_return true
	end

#4.2 As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy

	it 'does not allow planes to land when stormy' do
		expect { airport.land(plane) }.to raise_error 'Cannot land plane when weather is stormy'
		end

	it 'does not allow planes to take off when stormy' do
			expect { airport.take_off(plane) }.to raise_error 'Cannot take off when weather is stormy'
	end
	end
end



# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate







