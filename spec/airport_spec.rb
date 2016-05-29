require 'airport'
require 'weather'
require 'plane'

describe Airport do

	subject(:airport) {described_class.new}
	let(:plane) {double(:plane)}

	it 'accepts flying plane' do
		expect(airport.land(plane)).to eq "Welcome to London"
	end

	it 'allows landed plane to take off again' do
		airport.land(plane)
		expect(airport.take_off(plane)).to eq "Have a pleasant flight"
	end

	########### AFTER LANDING ##########

	it 'has the plane after landing' do
		airport.land(plane)
		expect(airport.in_airport?(plane)).to eq true
	end

	it 'does not have plane after takeoff' do
		airport.land(plane)
		airport.take_off(plane)
		expect(airport.in_airport?(plane)).to eq false
	end

end








