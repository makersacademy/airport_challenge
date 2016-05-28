require 'airport'

describe Airport do

	it { is_expected.to respond_to(:land).with(1).argument }
	it { is_expected.to respond_to(:take_off).with(1).argument }

	it 'accepts flying plane' do
		plane = Plane.new
		expect(subject.land(plane)).to eq "Plane landed"
	end
end