require 'plane'

describe Plane do

	let(:airport) { double(:airport, :landed_planes => []) }


	it { is_expected.to respond_to(:land).with(1).argument }
	it { is_expected.to respond_to(:take_off) }
	it { is_expected.to have_attributes(landed: true) }

	describe '#land' do
		it "lands at an airport" do
			subject.take_off(airport)
			subject.land(airport)
			expect(subject).to be_landed
			expect(airport.landed_planes).to include(subject)
		end
	end

	describe '#take-off' do
	 	it 'takes off from an airport', focus: :true do
	 		subject.land(airport)
	 		subject.take_off(airport)
	 		expect(subject).to_not be_landed
	 		expect(airport.landed_planes).to_not include(subject)
	 	end
	end


end