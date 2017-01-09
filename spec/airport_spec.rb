require 'airport'

describe Airport do
subject(:airport) { described_class.new}
let(:land_plane) {double :plane, :landed=>true}
let(:air_plane) {double :plane, :landed =>false}

	describe '#land' do
		it {is_expected.to respond_to(:land).with(1).argument}
		
		it 'should return plane is landed if weather is sunny' do
			allow(airport).to receive(:full?) {false}
			allow(airport).to receive(:stormy?) {false}
			expect{air_plane.landed?.to eq true}
		end
		
		it 'should return plane is not landed if weather is stormy' do
			allow(airport).to receive(:full?) {false}
			allow(airport).to receive(:stormy?) {true}
			expect{air_plane.landed?.to eq false}
		end

		it 'should not allow plane to land if capacity is zero' do
			allow(airport).to receive(:full?) {true}
			expect{airport.land(air_plane)}.to raise_error('Airport is full')
		end

		it 'should allow plane to land if capacity is not zero' do
			allow(airport).to receive(:full?) {false}
			expect{airport.land(air_plane).to eq true}
		end

		it 'should add one to planes array' do
			allow(airport).to receive(:full?) {false}
			allow(airport).to receive(:stormy?) {false}
			airport.land(air_plane)
  			expect(airport.planes).to include air_plane
		end

	end

	describe '#take_off' do
		it {is_expected.to respond_to(:take_off).with(1).argument}
		it 'should return plane is taken off if weather is sunny' do
			allow(airport).to receive(:stormy?) {false}
			expect{airport.take_off(land_plane).to eq false}
		end

		it 'should return plane is not taken if weather is stormy' do
			allow(airport).to receive(:stormy) {true}
			expect{airport.take_off(land_plane).to eq false}
		end
	
		it 'should raise error before take off about stormy weather 'do
			allow(airport).to receive(:stormy?) {true}
			expect{airport.take_off(land_plane)}.to raise_error('Weather is stormy, cannot take off')
		end

		it 'should remove plane from planes' do
			allow(airport).to receive(:stormy?) {false}
			airport.take_off(air_plane)
			expect{(airport.planes).to eq []}
		end

	end

	describe '#initialize' do

		context 'return defaults' do
			it 'should return 1 if no capacity is given' do
				expect{(Airport.new::capacity).to eq airport::DEFAULT_CAPACITY}
			end

			it ' airport default capacity should return 10 if no capacity is given' do
			expect(Airport.new).to have_attributes(:capacity => 1)
			end

		end

			it 'shoud return 12' do
			expect(Airport.new(12)).to have_attributes(:capacity => 12)
			end
	end

end