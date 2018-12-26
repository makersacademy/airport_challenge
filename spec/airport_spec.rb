require 'airport'

describe Airport do
  subject(:airport) { described_class.new(weather, 20) }
  let(:plane) { double :plane, land: nil, take_off: nil }
  let(:weather) { double :weather }

  describe '#land' do
    context 'when not stormy' do
      it 'instructs a plane to land' do
        allow(weather).to receive(:stormy?).and_return false
        expect(plane).to receive(:land)
        airport.land(plane)
      end

      context 'when full' do
        it 'raises an error' do
          allow(weather).to receive(:stormy?).and_return false
          20.times do
            airport.land(plane)
          end
          expect { airport.land(plane) }.to raise_error "Airport Full"
        end
      end
    end

    context 'when stormy' do
      it 'raises an error' do
        allow(weather).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error "Cannot land plane: Weather stormy"
      end
    end
  end

  describe '#take_off' do

    context 'when stormy' do
      it 'raises an error' do
        allow(weather).to receive(:stormy?).and_return true
        expect { airport.take_off(plane) }.to raise_error "Cannot take off: Weather stormy"
      end
    end

    context 'when not stormy' do

      it 'instructs a plane to take off' do
        allow(weather).to receive(:stormy?).and_return false
        airport.land(plane)
        expect(plane).to receive(:take_off)
        airport.take_off(plane)
      end

      it 'raises an error if airplane not at airport' do
        allow(weather).to receive(:stormy?).and_return false
        other_airport = described_class.new(weather, 20)
        other_airport.land(plane)
        expect { airport.take_off(plane) }.to raise_error "Cannot take off: Plane not at this airport"
      end
    end
  end
  context 'defaults' do
    subject(:default_airport) { described_class.new(weather) }
    it 'has a default capacity' do
      allow(weather).to receive(:stormy?).and_return false
      described_class::DEFAULT_CAPACITY.times { default_airport.land(plane) }
      expect { default_airport.land(plane) }.to raise_error "Airport Full"
    end
  end
end
