require 'airport'

describe Airport do

		it { is_expected.to respond_to(:land).with(1).argument }

		it 'lands a plane' do
				plane = Plane.new
				expect(subject.land(plane)).to eq plane
		end

		it { is_expected.to respond_to(:take_off).with(1).argument }

		it 'takes off a plane' do 
				plane = Plane.new 
				plane = Plane.new
				subject.land(plane)
				expect(subject.take_off(plane)).to eq subject
		end

end 
