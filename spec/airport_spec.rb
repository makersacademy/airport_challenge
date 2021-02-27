require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:airport) { Airport.new(Airport::DEFAULT_CAPACITY, weather) }
  let(:plane) { double :plane, land: nil, take_off: nil }
  let(:weather) { double :weather }

  describe '#land' do
    it 'clearance for landing' do
      allow(weather).to receive(:stormy?).and_return false
      expect(plane).to receive(:land)
      airport.land(plane)
    end

    context 'when full' do
      it 'prevents a plane from landing' do
        allow(weather).to receive(:stormy?).and_return false
        Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error "Unable to land: airport is full!"
      end
    end

    context 'when stormy' do
      it 'prevents a plane from landing' do
        allow(weather).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error "Unable to land: stormy weather"
      end
    end
  end

  describe '#take_off' do
    context 'when not stormy' do
      it 'allows a plane to take off from the airport' do
        allow(weather).to receive(:stormy?).and_return false
        airport.land(plane)
        expect(plane).to receive(:take_off)
        airport.take_off(plane)
      end
    end
    context 'when stormy' do
      it 'prevents a plane from taking off' do
        allow(weather).to receive(:stormy?).and_return true
        expect { airport.take_off(plane) }.to raise_error "Unable to take off: stormy weather"
      end
    end
  end
  describe 'default capacity' do
    it 'has a default capacity that can be overridden as appropriate' do
      allow(weather).to receive(:stormy?).and_return false
      test_airport = Airport.new(weather)
      Airport::DEFAULT_CAPACITY.times { test_airport.land(plane) }
      expect { test_airport.land(plane) }.to raise_error "Unable to land: airport is full!"
    end
  end
end
