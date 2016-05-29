require 'airport'
require 'weather'
require 'plane'

describe Airport do

	subject(:airport) {described_class.new}
	let(:plane) {double(:plane, landed?: false)}
	let(:weather) {double(:weather, stormy?: false)}

	it 'has a default capacity' do
		expect(airport.capacity).to eq described_class::DEFAULT_CAPACITY
	end

	describe '#land' do

		it 'accepts flying plane' do
			expect(airport.land(plane)).to eq "Welcome to London"
		end

		it 'has the plane after landing' do
			airport.land(plane)
			expect(airport.in_airport?(plane)).to eq true
		end

		it 'raises error when plane has already landed' do
			airport.land(plane)
			allow(plane).to receive(:landed?).and_return(true)
			expect {airport.land(plane)}.to raise_error "Plane already landed"
		end

		# it 'does not allow the plane to land in a storm' do
		# 	allow(airport).to receive(:stormy?).and_return(true)
		# 	expect {airport.land(plane)}.to raise_error "Cannot land in a storm"
		# end

		it 'raises an error when full' do
			described_class::DEFAULT_CAPACITY.times {airport.land(plane)}
			expect {airport.land(plane)}.to raise_error "Airport full"
		end
	end

	describe '#take_off' do

		it 'allows landed plane to take off again' do
			airport.land(plane)
			expect(airport.take_off(plane)).to eq "Have a pleasant flight"
		end

		it 'does not have plane after takeoff' do
			airport.land(plane)
			airport.take_off(plane)
			expect(airport.in_airport?(plane)).to eq false
		end

		# it 'raises error when plane has already taken off' do
		# 	airport.land(plane)
		# 	airport.take_off(plane)
		# 	allow(plane).to receive(:landed?).and_return(false)
		# 	expect {airport.take_off(plane)}.to raise_error "Plane already taken off"
		# end

	end

end








