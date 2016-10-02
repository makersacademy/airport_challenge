require 'airport'

describe Airport do

	subject(:airport) { described_class.new }
	let(:plane) { double (:plane) }

	it { is_expected.to have_attributes(landed_planes: [], capacity: Airport::DEFAULT_CAPACITY) }
	it { is_expected.to respond_to(:full?) }
	it { is_expected.to respond_to(:land).with(1).argument }

	context 'landing' do

		it 'lands a plane at the airport' do
			airport.land(plane)
			expect(airport.landed_planes).to include(plane)
		end

	end


	context 'airport capacity' do

		it 'returns true if airport is full' do
			airport.capacity.times { airport.landed_planes.push(double(:plane)) }
			expect(airport.full?).to eq(true)
		end
		
	end

end

