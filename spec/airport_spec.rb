require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:plane) { double :plane }
  let(:airport) { Airport.new }

  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do
    it 'lands a plane at the airport' do
      allow(airport).to receive(:stormy?).and_return(false)
      expect(airport.land(plane)).to eq [plane]
    end

    it 'prevents a plane from landing in the event of bad weather' do
      allow(airport).to receive(:stormy?).and_return(true)
      expect { airport.land(plane) }.to raise_error("Plane is unable to land due to weather conditions")
    end
  end

  describe '#take_off' do
    before { allow(airport).to receive(:stormy?).and_return(false) }

    it 'confirms that plane has departed from airport' do
      airport.land(plane)
      expect(airport.take_off(plane)).to eq "Plane is no longer at the airport"
    end

    it 'prevents take off in the event of bad weather' do
      airport.land(plane)
      allow(airport).to receive(:stormy?).and_return(true)
      expect { airport.take_off(plane) }.to raise_error("Plane is unable to take off due to weather conditions")
    end
  end

  describe '#full?' do
    it 'prevents landing if the airport is full' do
      allow(airport).to receive(:stormy?).and_return(false)
      Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error("Airport is full")
    end

    it 'allows user to change airport capacity' do
      allow(airport).to receive(:stormy?).and_return(false)
      airport = Airport.new(3)
      3.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error("Airport is full")
    end
  end
end
