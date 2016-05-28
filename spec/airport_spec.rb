require 'airport'

describe Airport do

	it { is_expected.to respond_to(:land).with(1).argument }
	it { is_expected.to respond_to(:take_off).with(1).argument }

	it 'accepts flying plane' do
		plane = Plane.new
		expect(subject.land(plane)).to eq plane
	end

	it 'allows plane to take off' do
		plane = Plane.new
		plane.plane_flying? == false
		expect(subject.take_off(plane)).to eq plane
	end

	it 'allows landed plane to take off again' do
		plane = Plane.new
		subject.land(plane)
		expect(subject.take_off(plane)).to eq plane
	end
end