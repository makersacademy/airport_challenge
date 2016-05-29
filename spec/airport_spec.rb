require 'airport'
require 'weather'
require 'plane'

describe Airport do

	subject(:airport) {described_class.new}
	let(:plane) {double(:plane)}

	########### BEFORE LANDING ##########

	it 'accepts flying plane' do
		expect(airport.land(plane)).to eq "Welcome to London"
	end

	describe '#land' do
		it 'raises an error when full' do
			20.times {airport.land(plane)}
			expect {airport.land(plane)}.to raise_error "Airport full"
		end
	end

	it 'allows landed plane to take off again' do
		airport.land(plane)
		expect(airport.take_off(plane)).to eq "Have a pleasant flight"
	end

	########### AFTER LANDING ##########

	it 'has the plane after landing' do
		airport.land(plane)
		allow(plane).to receive(:landed?).and_return(true)
		expect(airport.in_airport?(plane)).to eq true
	end

	it 'does not have plane after takeoff' do
		airport.land(plane)
		airport.take_off(plane)
		allow(plane).to receive(:landed?).and_return(false)
		expect(airport.in_airport?(plane)).to eq false
	end

end








