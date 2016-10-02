require 'airport'

describe Airport do

	before(:each) { @default_capacity = Airport::DEFAULT_CAPACITY }
	
	subject(:airport) { described_class.new }
	let(:plane) { double (:plane) }
	let(:stormy_weather) { double(:weather, stormy: true) }
	it { is_expected.to have_attributes(landed_planes: [], 
									capacity: @default_capacity) }

	context 'landing' do

		it 'instructs the plane to land' do
			expect(plane).to receive(:land)
			airport.land(plane)
		end

		it 'lands a plane at the airport' do
			allow(plane).to receive(:land)
			airport.land(plane)
			expect(airport.landed_planes).to include(plane)
		end
	end

	context 'taking off' do

		it 'instructs the plane to take off' do
			expect(plane).to receive(:take_off)
			airport.take_off(plane)
		end

		it 'takes off a plan from the airport' do
			allow(plane).to receive(:take_off)
			airport.take_off(plane)
			expect(airport.landed_planes).to_not include(plane)
		end

	end

	# context 'stormy weather' do

	# 	it 'does not let the plane land in stormy weather' do
	# 		expect()
	# end
	context 'airport capacity' do

		it 'returns true if airport is full' do
			airport.capacity.times { airport.landed_planes.push(double(:plane)) }
			expect(airport.full?).to eq(true)
		end
		
	end

end

