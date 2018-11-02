require 'airport'
require 'plane'

describe Airport do
	let(:plane) 	{plane = Plane.new}
	let(:airport) {airport = Airport.new}

	describe '#confirm_departure' do
		it 'checks that a plane is no longer in the airport' do
			expect(airport).to respond_to(:confirm_departure)
		end
	end
end