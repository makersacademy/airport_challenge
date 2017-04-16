require 'airport'

describe Airport do

  it { is_expected.to respond_to :planes}

  subject(:airport) { described_class.new }
  subject(:airport_cap_1) { described_class.new 1}
  let(:plane) { Plane.new }

  before do
    allow(airport.weather).to receive(:stormy?) { false }
    allow(airport_cap_1.weather).to receive(:stormy?) { false }
  end

  describe '#capacity' do

    it 'has a default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'allows user to set @capacity' do
      airport_cap_10 = Airport.new 10
      expect(airport_cap_10.capacity).to eq(10)
    end

  end

  describe '#land' do

    it 'raises an error when weather is stormy' do
      allow(airport.weather).to receive(:stormy?) { true }
      message = 'Too stormy to land'
      expect { airport.land(plane) }.to raise_error message
    end

    it 'raises an error if airport is full' do
      plane2 = Plane.new
      airport_cap_1.land(plane)
      message2 = 'Airport is too full to land'
      expect { airport_cap_1.land(plane2) }.to raise_error message2
    end

    it 'raises an error when plane is not in flight' do
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error 'Plane is not in flight'
    end

    it 'tells the plane to land' do
      expect(plane).to receive(:land)
      airport.land(plane)
    end

    it 'adds the plane to the airport' do
      airport.land(plane)
      expect(airport.planes.include?(plane)).to eq true
    end

  end

  describe '#take_off' do

    it 'tells the plane to take off' do
      airport.land(plane)
      expect(plane).to receive(:take_off)
      airport.take_off(plane)
    end

    it 'removes the plane from the airport' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes.include?(plane)).to eq false
    end

    it 'raises an error if plane is not at the given airport' do
      airport2 = Airport.new
      airport.land(plane)
      msg3 = 'Plane is not at given airport'
      expect { airport2.take_off(plane) }.to raise_error msg3
    end

    it 'raises an error when weather is stormy' do
      airport.land(plane)
      allow(airport.weather).to receive(:stormy?) { true }
      msg4 = 'Too stormy to take off'
      expect { airport.take_off(plane) }.to raise_error msg4
    end

    it 'raises an error when plane is already in flight' do
      message3 = 'Plane is already in flight'
      expect { airport.take_off(plane) }.to raise_error message3
    end

  end

end
