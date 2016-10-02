require 'airport'

describe Airport do
	alias airport subject


	it { is_expected.to have_attributes(landed_planes: []) }
	it { is_expected.to respond_to(:full?) }

	describe 'full?' do
		it 'returns true if airport is full' do
			20.times { airport.landed_planes.push(double(:plane)) }
			expect(airport.full?).to eq(true)
		end
	end
end

