require 'airport'

describe Airport do
	subject(:airport){ Airport.new }

	it 'has a default capacity' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
	end

	# As an air traffic controller 
	# To ensure safety 
	# I want to prevent landing when the airport is full 
	it { is_expected.to respond_to :maximum_capacity? }

	# As an air traffic controller 
	# To ensure safety 
	# I want to prevent takeoff when weather is stormy
	it { is_expected.to respond_to :takeoff?}

	# As an air traffic controller 
	# To ensure safety
	# I want to prevent landing when weather is stormy
	it { is_expected.to respond_to :stormy?}

	# As the system designer
	# So that the software can be used for many different airports
	# I would like a default airport capacity that can be overridden as appropriate
	it { is_expected.to respond_to :capacity}

end