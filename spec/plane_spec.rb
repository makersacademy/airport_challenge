require 'plane'

describe Plane do
	let(:plane) { described_class.new}
	let(:airport) { spy(:airport) }

	it 'it responds to landed?' do
		expect(plane).to respond_to(:landed?)
	end

	it 'plane landed status changes to `true` after landing' do
		plane.land
		expect(plane.landed?).to eq true
	end

	it 'updated landed? status to false when called take_off' do
		plane.take_off
		expect(plane.landed?).to eq false
	end
end