require 'plane'

describe Plane do
	it {is_expected.to respond_to(:land).with(1).argument}
	let(:airport) { double(:airport, :landed_planes => []) }

	describe '#land' do
		it "lands at an airport" do
			subject.land(airport)
			expect(subject).to be_landed
			expect(airport.landed_planes).to include(subject)
		end
	end

end