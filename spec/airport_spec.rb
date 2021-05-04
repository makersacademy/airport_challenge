require 'airport'

describe 'Airport' do
  airport = Airport.new
  plane = "easyjet"


  describe '#default_capacity' do
    it 'sets default capacity' do
      expect(airport.capacity).to eq 10
    end
  end

  describe '#land' do

    it 'plane lands at the airport' do
      allow(airport).to receive(:weatherforecast) { "calm" }
      expect(airport.land(plane)).to eq [plane]
    end

    it 'cant land at airport when its stormy' do
      allow(airport).to receive(:weatherforecast) { "stormy" }
      expect { airport.land(plane) }.to raise_error "Can't land, stormy weather"
    end
  end

  describe '#takeoff' do

    it 'cant take off when its stormy' do
      allow(airport).to receive(:weatherforecast) { "stormy" }
      expect { airport.takeoff(plane) }.to raise_error "Can't take off, stormy weather"
    end

    it 'check if a plane stayed during stormy weather' do
      allow(airport).to receive(:weatherforecast) { "stormy" }
      expect(airport.listplanes).to eq [plane]
    end

    it 'plane takes off from the airport when its calm' do
      allow(airport).to receive(:weatherforecast) { "calm" }
      airport.takeoff(plane)
      expect(airport.listplanes).to eq []
    end
  end

  describe '#full' do
    it 'checks if airport is full' do
      expect(airport.airportfull?).to eq false
    end
  end
end
