require 'plane'
require 'airport'
require 'weather'

describe Plane do
	subject(:plane) {described_class.new}
	let(:weather) {double (:weather)}

	before do
		allow(weather).to receive(:state) {'sunny'}
	end

	describe '#at_airport?' do
		it 'responds true if incoming plane lands successfully' do
			airport = Airport.new
			airport.incoming_plane(plane, weather.state)
			expect(plane.at_airport?).to eq true
		end		
		it 'responds false once landed plane has taken off' do
			airport = Airport.new
			airport.incoming_plane(plane, weather.state)
			airport.departing_plane(plane, weather.state)
			expect(plane.at_airport?).to eq false
		end
	end

end