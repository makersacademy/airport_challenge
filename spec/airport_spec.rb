require 'airport'

describe Airport do
  subject(:airport) { described_class.new(Airport::DEF_CAPACITY, weather) }
  let(:plane) { double(:plane) }
  let(:weather) { double(:weather, stormy?: false) }

  describe '#land' do
    before(:each) do
      allow(plane).to receive(:land).and_return(plane)
    end

    it 'has the plane that is instructed to land' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    it 'raises error, prevent land on stormy weather' do
      allow(weather).to receive(:stormy?).and_return(true)
      message = 'Cannot land on a storm! Try again!'
      expect { airport.land(plane) }.to raise_error(message)
    end

    it 'raises error, prevent land if it is full' do
      airport = Airport.new(2, weather)
      2.times { airport.land(plane) }
      message = 'Cannot land on full airport!'
      expect { airport.land(plane) }.to raise_error(message)
    end
  end

  describe '#take_off' do
    before(:each) do
      allow(plane).to receive(:land).and_return(plane)
      airport.land(plane)
      allow(plane).to receive(:take_off).and_return(plane)
    end

    it 'no longer has the plane that is instructed to take off' do
      airport.take_off(plane)
      expect(airport.planes).not_to include plane
    end

    it 'raises error, prevent take off on stormy weather' do
      allow(weather).to receive(:stormy?).and_return(true)
      message = 'Cannot take off on a storm! Try again!'
      expect { airport.take_off(plane) }.to raise_error(message)
    end

    it 'raises error if plane is not in the airport' do
      other_plane = double(:other_plane)
      message = 'Plane not in the airport!'
      expect { airport.take_off(other_plane) }.to raise_error(message)
    end
  end

  describe '#capacity' do
    it 'has a default capacity' do
      expect(airport.capacity).to eq Airport::DEF_CAPACITY
    end

    it 'can be initialized with a different capacity' do
      cap = 5
      airport = Airport.new(cap)
      expect(airport.capacity).to eq cap
    end
  end
end
