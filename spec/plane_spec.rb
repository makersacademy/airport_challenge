require 'plane'
require 'airport'

describe Plane do
	let(:plane) 	{plane = Plane.new}
	let(:airport) {airport = Airport.new}
	
	describe '#land_at_airport' do
		before {expect(plane).to receive(:land_at_airport).with(airport)}
		it 'lands at the passed airport' do
			plane.land_at_airport(airport)
		end
	end

	describe '#land_at_airport' do
		it 'checks plane stored as instance variable when landed' do
			plane.land_at_airport(airport)

			expect(airport.planes_present).to include(plane)
		end
	end

	describe '#takeoff_from_airport' do
		before {expect(plane).to receive(:takeoff_from_airport).with(airport)}
		it 'takes off from the passed airport' do
			plane.takeoff_from_airport(airport)
		end
	end
end