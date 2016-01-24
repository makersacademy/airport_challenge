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
      message = 'Cannot land on a storm!'
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
      allow(plane).to receive(:land)
      airport.land(plane)
    end

    it 'no longer has the plane that is instructed to take off' do
      allow(plane).to receive(:take_off)
      airport.take_off(plane)
      expect(airport.planes).not_to include plane
    end

    it 'raises error, prevent take off on stormy weather' do
      allow(weather).to receive(:stormy?).and_return(true)
      allow(plane).to receive(:take_off)
      message = 'Cannot take off on a storm!'
      expect { airport.take_off(plane) }.to raise_error(message)
    end
  end
end
