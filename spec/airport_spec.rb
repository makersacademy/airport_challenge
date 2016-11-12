require 'airport'

describe Airport do

	subject(:airport) {described_class.new}
		
	let (:plane) {double :plane}

		it 'expects airport to land a plane' do
			expect(airport).to respond_to(:land).with(1).argument
		end

		it 'expects to hold a plane after it has landed' do
			airport.land(plane)
			expect(airport.planes).to include(plane)
		end

		it 'expects land to confirm a plane has landed' do
			expect(airport.land(plane)).to eq "#{plane} has landed."
		end
end