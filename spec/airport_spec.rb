require 'airport'
describe Airport do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  context 'when the weather is clear' do
    before do
      allow(airport).to receive(:stormy?).and_return(false)
    end

    describe '#initialize' do
      it 'has a default capacity' do
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      end

      it 'allows the default capacity to be overriden' do
        expect(Airport.new(20).capacity).to eq(20)
      end
    end

    describe '#land_plane' do
      it 'can land a plane ' do
        expect(airport).to respond_to(:land_plane).with(1).argument
      end

      context 'when at capacity' do
        it 'raises an error' do
          Airport::DEFAULT_CAPACITY.times { airport.land_plane(plane) }
          expect{ airport.land_plane Plane.new }.to raise_error 'Airport at maximum capacity, cannot land plane'
        end
      end
    end

    describe '#take_off_plane' do
      it 'can tell a plane to take off' do
        expect(subject).to respond_to(:take_off_plane)
      end

      it 'confirms the plane is no longer at the airport' do
        airport.land_plane(plane)
        number_of_planes = airport.current_occupancy
        airport.take_off_plane(plane)
        expect(airport.current_occupancy == (number_of_planes - 1))
      end

      it 'raises an error if the plane taking off is not at the airport' do
        expect{ airport.take_off_plane plane }.to raise_error 'No planes at the airport'
      end
    end
  end

  context 'when the weather is bad' do
    let(:stormy_airport) { stormy_airport = Airport.new}

    before do
      allow(stormy_airport).to receive(:stormy?).and_return(true)
    end

    it 'raises an error when a plane tries to take off during stormy weather' do
      expect{ stormy_airport.take_off_plane Plane.new }.to raise_error 'Cannot take off due to storm'
    end

    it 'raises an error while trying to land a plane during stormy weather' do
      expect{ stormy_airport.land_plane Plane.new }.to raise_error 'Cannot land plane due to storm'
    end
  end

end
