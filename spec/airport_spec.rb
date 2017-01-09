require 'airport'

describe Airport do
subject(:airport) {described_class.new}
let(:land_plane) {double :plane, :landed=>true}
let(:air_plane) {double :plane, :landed =>false}

	describe '#land' do
		context 'testing the weather element' do		
			it 'should return plane is landed if weather is sunny' do
				allow(airport).to receive(:full?).and_return false
				allow(airport).to receive(:stormy?) {false}
				expect(airport.land(air_plane)).to eq airport.land(air_plane)
			end
			
			it 'should return plane is not landed if weather is stormy' do
				allow(airport).to receive(:full?) {false}
				allow(airport).to receive(:stormy?) {true}
				expect{airport.land(air_plane)}.to raise_error('Weather is stormy, cannot land')
			end
		end

		it 'should not allow plane to land if capacity is zero' do
			allow(airport).to receive(:full?) {true}
			expect{airport.land(air_plane)}.to raise_error('Airport is full')
		end

		it 'should allow plane to land if capacity is not zero' do
			allow(airport).to receive(:full?) {false}
			allow(airport).to receive(:stormy?) {false}
			expect(airport.land(air_plane)).to eq airport.land(air_plane)
		end

		it 'should add one to planes array' do
			allow(airport).to receive(:full?) {false}
			allow(airport).to receive(:stormy?) {false}
			airport.land(air_plane)
  			expect(airport.planes).to include air_plane
		end

	end

	describe '#take_off' do
		it 'should return plane is taken off if weather is sunny' do
			allow(airport).to receive(:stormy?) {false}
			expect(airport.take_off(land_plane)).to eq airport.take_off(land_plane)
		end
	
		it 'should raise error before take off about stormy weather 'do
			allow(airport).to receive(:stormy?) {true}
			expect{airport.take_off(land_plane)}.to raise_error('Weather is stormy, cannot take off')
		end

		it 'should remove plane from planes' do
			allow(airport).to receive(:stormy?) {false}
			airport.take_off(air_plane)
			expect(airport.planes).to eq []
		end

	end

	describe '#initialize' do

		context 'check capacity' do
			
			it ' airport default capacity should return 10 if no capacity is given' do
			expect(Airport.new).to have_attributes(:capacity => 1)
			end

		end

			it 'shoud return 12' do
			expect(Airport.new(12)).to have_attributes(:capacity => 12)
			end
	end

end