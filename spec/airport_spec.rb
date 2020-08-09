require 'airport'

describe Airport do

	it { is_expected.to respond_to(:land).with(1).argument }


	describe 'land' do

		it 'land a plane' do
		  plane = Plane.new
		  expect(subject.land(plane)).to eq [plane]
		end


	end

	describe 'take_off' do

		it 'plane has left the airport' do
			plane = Plane.new
			subject.land(plane)
			expect(subject.take_off).to eq plane
		end

		it 'raises error if no planes available' do
			expect { subject.take_off }.to raise_error('No planes available')
		end
	end


 





end