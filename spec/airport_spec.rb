require 'airport'
require 'plane'
require 'weather'

describe Airport do
	let(:plane) 	{plane = Plane.new}
	let(:airport) {airport = Airport.new}

	describe '#confirm_departure' do
		it 'checks that a plane is no longer in the airport' do
			weather = "sunny"
			plane.land_at_airport(airport, weather)
			plane.takeoff_from_airport(airport, weather)
			airport.confirm_departure(plane)

			expect(airport.planes_present).not_to include(plane)
		end
	end
end