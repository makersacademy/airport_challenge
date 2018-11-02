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
end