require 'airport'

describe Airport do

	subject(:airport) {described_class.new}

	it 'expects airports to have a default capacity' do
		expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
	end

	it 'expects new airports to accept a custom capacity' do
		airport = Airport.new(10)
		expect(airport.capacity).to eq (10)
	end

	describe '#land' do

		it 'expects landing to raise error if weather is stormy' do
			plane = double(:plane, flying: true)
			allow(airport).to receive(:stormy?) { true }
			expect{airport.land(plane)}.to raise_error("#{plane} cannot land due to stormy weather.")
		end

	end

	context '#land tests that require non-stormy weather' do

		before do
			allow(airport).to receive(:stormy?) { false }
		end

		it 'expects to hold a plane after it has landed' do
			plane = double(:plane, flying: true)
			allow(plane).to receive(:landed)
			airport.land(plane)
			expect(airport.planes).to include(plane)
		end

		it 'expects a landing to be successful if weather is sunny' do
			plane = double(:plane, flying: true)
			allow(plane).to receive(:landed)
			expect(airport.land(plane)).to eq "#{plane} has landed."
		end

		it 'expects planes to be unable to land when airport is full' do
			plane = double(:plane, flying: true)
			allow(plane).to receive(:landed)
			airport.capacity.times {airport.land(plane)}
			expect{airport.land(plane)}.to raise_error("Airport is full.")
		end

		it 'expects planes that wish to land to be flying' do
			plane = double(:plane, :flying => false)
			expect{airport.land(plane)}.to raise_error("#{plane} is already on the ground.")
		end

	end

	describe '#take_off' do

		it 'expects take off to raise error if weather is stormy' do
			plane = double(:plane, :flying => false)
			allow(airport).to receive(:stormy?) { true }
			airport.planes << plane
			expect{airport.take_off(plane)}.to raise_error("#{plane} cannot take off due to stormy weather.")
		end

	end

	context '#take_off tests that require non-stormy weather' do

		before do
			allow(airport).to receive(:stormy?) { false }
		end

		it 'expects plane to have left the airport after it has taken off' do
			plane = double(:plane, :flying => false)
			allow(plane).to receive(:taken_off)
			airport.planes << plane
			airport.take_off(plane)
			expect(airport.planes).not_to include(plane)
		end

		it 'expects take off to be successful if weather is sunny' do
			plane = double(:plane, :flying => false)
			allow(plane).to receive(:taken_off)
			airport.planes << plane
			expect(airport.take_off(plane)).to eq "#{plane} has left the airport."
		end

		it 'expects planes that wish to take off to be at the airport' do
			plane = double(:plane, :flying => false)
			expect{airport.take_off(plane)}.to raise_error("#{plane} does not exist at this airport.")
		end

		it 'expects planes that wish to take off to be grounded' do
			plane = double(:plane, :flying => true)
			expect{airport.take_off(plane)}.to raise_error("#{plane} is already flying.")
		end

	end

	describe '#stormy?' do

		it 'expects stormy? to be true when given random number 0' do
			allow(airport).to receive(:random_number) { 0 }
			expect(airport.stormy?).to eq true
		end
		
		it 'expects stormy? to be false when given random number 1' do
			allow(airport).to receive(:random_number) { (1) }
			expect(airport.stormy?).to eq false
		end

	end

end