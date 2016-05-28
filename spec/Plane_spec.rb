require 'Plane'
require 'Airport'

describe Plane do
	subject(:plane) {described_class.new}

	describe '#at_airport?' do
		it 'responds true if incoming plane lands successfully' do
			airport = Airport.new
			airport.incoming_plane(plane, 'sunny')
			expect(plane.at_airport?).to eq true
		end		
		it 'responds false once landed plane has taken off' do
			airport = Airport.new
			airport.incoming_plane(plane, 'sunny')
			airport.departing_plane(plane, 'sunny')
			expect(plane.at_airport?).to eq false
		end
	end

end