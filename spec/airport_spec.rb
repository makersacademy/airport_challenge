require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new(20) }
  let(:plane) { double:plane }

  describe '#land' do
    it 'instructs a plane to land' do
      allow(airport).to receive(:stormy?).and_return false
      expect { airport.to respond_to(:land).with(1).argument }
    end

    it 'does not allow a plane to land when stormy' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land(plane) }.to raise_error "Cannot land plane: weather is stormy"
    end

    it 'does not allow landing when airport is full' do
      allow(airport).to receive(:stormy?).and_return false
      20.times do
        airport.land(plane)
    end
      expect { airport.land(plane) }.to raise_error "Cannot land plane: airport is full"
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off' do
      allow(airport).to receive(:stormy?).and_return false
      expect { airport.to respond_to(:take_off).with(1).argument }
    end

    it 'does not allow plane to take off when stormy' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.take_off(plane) }.to raise_error "Cannot take off plane: weather is stormy"
    end

    it 'does not allow a plane to take off from another airport' do
      allow(airport).to receive(:stormy?).and_return false
        other_airport = Airport.new(20)
        other_airport.land(plane)
        expect { airport.take_off(plane) }.to raise_error "Cannot take off plane: it is not in this airport"
      end
    end
end
