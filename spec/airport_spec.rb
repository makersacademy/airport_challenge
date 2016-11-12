require 'airport'

describe Airport do

	subject(:airport) {described_class.new}
		
	let (:plane) {double :plane}

	describe '#land' do

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

	describe '#take_off' do
		
		it 'expects airport to let a plane take off' do
			expect(airport).to respond_to(:take_off).with(1).argument
		end

		it 'expects take off to confirm a plane has left their airport' do
			airport.planes << plane
			expect(airport.take_off(plane)).to eq "#{plane} has left the airport."
		end

		it 'expects plane to have left the airport after it has taken off' do
			airport.planes << plane
			airport.take_off(plane)
			expect(airport.planes).not_to include(plane)
		end

	end

end