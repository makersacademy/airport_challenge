require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:plane) { double(:plane, take_off: nil, land: nil) }
  let(:weather) { double(:weather, stormy?: false) }
  subject(:airport) { described_class.new weather }

  it 'has a default capacity' do
    expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  describe "#land" do
    before do
      allow(plane).to receive(:land)
    end

    it 'lands a plane in the airport' do
      airport.land(plane)
    end

    it 'has the plane after it has landed' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    it 'does not allow plane already landed to land again' do
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error "Plane has already landed in the airport"
    end

    it 'raise an error when the airport is full' do
      allow(weather).to receive(:stormy?).and_return(false)
      airport.capacity.times do
        plane = double(:plane)
        allow(plane).to receive(:land).and_return(false)
        airport.land(plane)
      end
      expect { airport.land(plane) }.to raise_error "Airport full"
    end

    it 'will prevent landing when the weather is stormy' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect { airport.land(plane) }.to raise_error "It is too stormy to land"
    end
  end

  describe "#take_off" do
    before do
      allow(plane).to receive(:land).and_return(false)
      allow(plane).to receive(:take_off).and_return(true)
    end

    it 'instructs the plane to take off' do
      allow(weather).to receive(:stormy?).and_return(false)
      airport.land(plane)
      airport.take_off(plane)
    end

    it 'confirms that the plane taken off is no longer at the airport' do
      allow(weather).to receive(:stormy?).and_return(false)
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).to eq []
    end

    it 'can only allow planes already landed to take off' do
      allow(weather).to receive(:stormy?).and_return(false)
      expect { airport.take_off(plane) }.to raise_error "Plane can't take off if it has not landed at the airport"
    end

    it 'will prevent taking off when the weather is stormy' do
      allow(plane).to receive(:land)
      airport.land(plane)
      allow(weather).to receive(:stormy?).and_return(true)
      expect { airport.take_off(plane) }.to raise_error "It is too stormy to take off"
    end
  end
end
