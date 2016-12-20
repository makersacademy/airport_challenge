require 'plane'

describe Plane do
	
	subject(:plane) {described_class.new}

	it 'expects to be grounded after landing' do
		plane.landed
		expect(plane.flying).to eq false
	end

	it 'expects to be flying after taking off' do
		plane.taken_off
		expect(plane.flying).to eq true
	end

end