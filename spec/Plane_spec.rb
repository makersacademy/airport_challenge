require 'airport'

describe Plane do

	subject(:plane) {described_class.new}
	let(:goodweather) {double :weather, state: 'sunny'}

	describe '#at_airport?' do

		it 'responds true if incoming plane lands successfully' do
			airport = Airport.new
			airport.incoming_plane(plane, goodweather.state)
			expect(plane.at_airport?).to eq true
		end		
		it 'responds false once landed plane has taken off' do
			airport = Airport.new
			airport.incoming_plane(plane, goodweather.state)
			airport.departing_plane(plane, goodweather.state)
			expect(plane.at_airport?).to eq false
		end
		
	end

end