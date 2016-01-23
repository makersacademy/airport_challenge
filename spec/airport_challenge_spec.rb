require 'plane'

describe Plane do

#create a test that responds to the method land
	it {is_expected.to respond_to(:land).with(1).argument }


	it 'land to an airport' do
		airport = Airport.new
		expect(subject.land(airport)).to eq 'Plane landed!'
	end




end
