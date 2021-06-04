require 'airport'
describe Airport do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  # it 'has an airport that can instruct planes' do
  describe '#initialize' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'allows the default capacity to be overriden' do
      new_capacity = rand(1000)
      large_airport = Airport.new(new_capacity + 1)
      new_capacity.times { large_airport.land_plane Plane.new }
      expect(large_airport.land_plane(Plane.new)).to eq('Plane landed')
    end
  end

  context 'when the weather is clear' do
    before do
      allow(airport).to receive(:stormy?).and_return(false)
    end

    it 'can land a plane if space is available' do
      expect(subject.land_plane(plane)).to eq('Plane landed')
    end


    describe '#land_plane' do
      it 'raises an error when trying to land a plane while at maximum capacity' do
        Airport::DEFAULT_CAPACITY.times { subject.land_plane(plane) }
        expect{ subject.land_plane Plane.new }.to raise_error 'Airport at maximum capacity, cannot land plane'
      end
    end

    describe '#take_off_plane' do
      it 'can tell a plane to take off' do
        expect(subject).to respond_to(:take_off_plane)
      end

      it 'confirms the plane is no longer at the airport' do
        # plane = Plane.new
        expect(subject.take_off_plane(plane)).to eq "Plane has left the airport"
      end

      it 'raises an error if the plane taking off is not at the airport' do
        expect{ airport.take_off_plane plane }.to raise_error 'No planes at the airport'
      end
    end
  end

  context 'when the weather is bad' do
    before do
      allow(airport).to receive(:stormy?).and_return(true)
    end

    it 'raises an error when a plane tries to take off during stormy weather' do
      allow(airport).to receive(:stormy?) { 10 }
      expect{ airport.take_off_plane Plane.new }.to raise_error 'Cannot take off due to storm'
    end

    it 'raises an error while trying to land a plane during stormy weather' do
      stormy_airport = Airport.new
      allow(stormy_airport).to receive(:stormy?) { 10 }
      expect{ stormy_airport.land_plane Plane.new }.to raise_error 'Cannot land plane due to storm'
    end
  end

end
