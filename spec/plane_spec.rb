require 'plane'

describe Plane do

	# subject {Plane}
	# let(:bike) { double :bike, broken?: false }
	let(:airport) {double :airport, class: Airport}

	it { is_expected.to respond_to(:land).with(1).argument }

	it { is_expected.to respond_to(:take_off).with(1).argument }

	it 'checks that the plane take off from airport' do
		expect(subject.take_off(airport)).to eq "Departed to: #{airport}"
	end

	it 'checks that planes only take off from actual airplanes' do
		expect{subject.take_off("airport")}.to raise_error("Can only take off from an airport")
	end

	it 'checks that the plane land in an airport' do
		expect(subject.land(airport)).to eq "Landed in: #{airport}"
	end

	it 'checks that planes only land in an actual airplanes' do
		expect{subject.land("airport")}.to raise_error("Can only land in an airport")
	end

end