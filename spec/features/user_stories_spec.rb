require 'airport'
require 'plane'

describe "User Stories" do
	let(:airport) { Airport.new(20) }
	let(:plane)   { Plane.new   }

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport and confirm that it has landed
it 'allows a plane to land at an airport' do
	expect{ airport.land(plane) }.not_to raise_error
end

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
it 'allows a plane to take off' do
	expect{ airport.take_off(plane) }.not_to raise_error
end

# As an air traffic controller
# To ensure safety
# I want to prevent landing when my airport is full
it 'does not allow planes to land when airport is full' do
	airport.capacity.times { airport.land(plane) }
	expect { airport.land(plane) }.to raise_error "Sorry mate- the airport is full"
end

# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy
#
# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full
#
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

end
