require 'airport'

describe Airport do

	it { is_expected.to respond_to(:land).with(1).argument }




	describe 'land' do
		it 'land a plane' do
		  plane = Plane.new
		  airport = Airport.new
		  airport.land(plane)
		  expect(subject.land(plane)).to eq plane
		end
	end
 





end