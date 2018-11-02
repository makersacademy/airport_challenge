require 'plane'

describe Plane do
	let(:plane) {plane = Plane.new}
	
	describe '#land_at_airport' do
		it 'lands at an airport' do
			expect(plane).to respond_to(:land_at_airport)
		end
	end

end