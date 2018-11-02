require 'plane'
require 'airport'
require 'weather'

describe Plane do
	let(:plane) 	{plane = Plane.new}
	let(:airport) {airport = Airport.new}

	describe '#land_at_airport' do
		it 'checks plane stored as instance variable when landed' do
			weather = "sunny"
			plane.land_at_airport(airport, weather)

			expect(airport.planes_present).to include(plane)
		end
	end

	describe '#takeoff_from_airport' do
		before {expect(plane).to receive(:takeoff_from_airport).with(airport)}
		it 'takes off from the passed airport' do
			plane.takeoff_from_airport(airport)
		end
	end

	describe 'stormy weather takeoff' do
		it 'plane should not takeoff when weather is stormy' do
			weather = "stormy"
			expect {plane.takeoff_from_airport(airport, weather)}.to raise_error("Danger stormy weather")
		end
	end
end