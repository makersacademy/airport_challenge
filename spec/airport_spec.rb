require 'airport'

describe Airport do

	subject(:airport) {described_class.new}
		
	let (:plane) {double :plane}

		it { is_expected.to respond_to "land"}

		it 'expects to hold a plane after it has landed' do
			airport.land(plane)
			expect(airport.planes).to include(plane)
		end
end