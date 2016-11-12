require 'airport'

describe Airport do

	subject(:airport) {described_class.new.extend(Weather)}
		
	let (:plane) {double :plane}

	it 'expects airports to have a default capacity' do
		expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
	end

	it 'expects new airports to accept a custom capacity' do
		airport = Airport.new(10)
		expect(airport.capacity).to eq (10)
	end

	describe '#land?' do

		it 'expects airport to land a plane' do
			expect(airport).to respond_to(:land?).with(1).argument
		end

		it 'expects to hold a plane after it has landed' do
			allow(airport).to receive(:stormy?) { false }
			airport.land?(plane)
			expect(airport.planes).to include(plane)
		end

		it 'expects landing to raise error if weather is stormy' do
			allow(airport).to receive(:stormy?) { true }
			expect{airport.land?(plane)}.to raise_error("#{plane} cannot land due to stormy weather.")
		end

		it 'expects a landing to be successful if weather is sunny' do
			allow(airport).to receive(:stormy?) { false }
			expect(airport.land?(plane)).to eq "#{plane} has landed."
		end

		it 'expects planes to be unable to land when airport is full' do
			allow(airport).to receive(:stormy?) { false }
			airport.capacity.times {airport.land?(plane)}
			expect{airport.land?(plane)}.to raise_error("Airport is full.")
		end

	end

	describe '#take_off' do
		
		it 'expects airport to let a plane take off' do
			expect(airport).to respond_to(:take_off?).with(1).argument
		end

		it 'expects plane to have left the airport after it has taken off' do
			allow(airport).to receive(:stormy?) { false }
			airport.planes << plane
			airport.take_off?(plane)
			expect(airport.planes).not_to include(plane)
		end

		it 'expects take off to raise error if weather is stormy' do
			allow(airport).to receive(:stormy?) { true }
			airport.planes << plane
			expect{airport.take_off?(plane)}.to raise_error("#{plane} cannot take off due to stormy weather.")
		end

		it 'expects take off to be successful if weather is sunny' do
			allow(airport).to receive(:stormy?) { false }
			airport.planes << plane
			expect(airport.take_off?(plane)).to eq "#{plane} has left the airport."
		end

	end

	describe Weather do

		subject(:weather) {described_class}
		
		it 'expects stormy? to be true when given random number 0' do
			allow(weather).to receive(:random_number) { 0 }
			expect(weather.stormy?).to eq true
		end
		
		it 'expects stormy? to be false when given random number 1' do
			allow(weather).to receive(:random_number) { 1 }
			expect(weather.stormy?).to eq false
		end

	end

end