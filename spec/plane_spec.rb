require 'plane'
require 'airport'

describe Plane do

	subject(:plane) {described_class.new}
	let(:airport) {double(:airport, land: false, take_off: false)}

	describe '#landed?' do

		it "has landed" do
			airport.land(plane)
			allow(plane).to receive(:landed?).and_return(true)
			expect(plane.landed?).to eq true
		end

		it "has taken off" do
			airport.land(plane)
			airport.take_off(plane)
			allow(plane).to receive(:landed?).and_return(false)
			expect(plane.landed?).to eq false
		end

	end

end