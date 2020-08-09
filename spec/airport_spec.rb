require 'airport'

describe Airport do

	it { is_expected.to respond_to(:land).with(1).argument }


	describe 'land' do

		it 'land a plane' do
		  plane = Plane.new
		  expect(subject.land(plane)).to eq [plane]
		end

		it 'prevention of landing if Airport full' do
			30.times { subject.land(Plane.new) }
			expect { subject.land Plane.new }.to raise_error 'Airport Full'
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