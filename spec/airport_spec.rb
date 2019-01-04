require 'airport'

describe Airport do
  subject(:airport) { described_class.new(weather, 20) }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  describe '#land' do
    context 'when not stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end

      it 'instructs a plane to land' do
        expect(airport).to respond_to(:land).with(1).argument
      end

      context 'when full' do
        it 'raises an error' do
          20.times do
            airport.land(plane)
          end
          expect { airport.land(plane) }.to raise_error 'Plane is unable to land: airport is full'
        end
      end
    end

    context 'when stormy' do
      it 'raises an error if asked to land plane' do
        allow(weather).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error 'Warning: Storm approaching, unable to land plane'
      end
    end
  end

  describe '#take_off' do
    context 'when not stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end

      it 'instructs a plane to takeoff' do
        expect(airport).to respond_to(:takeoff).with(1).argument
      end

      it 'returns the plane that took off' do
        airport.land(plane)
        expect(airport.takeoff(plane)).to eq plane
      end

      it 'raises an error if plane is not at this airport' do
        other_airport = Airport.new(weather, 20)
        other_airport.land(plane)
        expect { airport.takeoff(plane) }.to raise_error 'Cannot takeoff plane: plane is not at this airport'
      end
    end

    context 'when stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return true
      end

      it 'raises an error if asked to takeoff plane' do
        expect { airport.takeoff(plane) }.to raise_error 'Warning: Storm approaching, planes are unable to takeoff'
      end
    end
  end

  context 'defaults' do
    subject(:default_airport) { described_class.new(weather) }

    it 'has a default capacity' do
      allow(weather).to receive(:stormy?).and_return false
      described_class::DEFAULT_CAPACITY.times { default_airport.land(plane) }
      expect { default_airport.land(plane) }.to raise_error 'Plane is unable to land: airport is full'
    end
  end
end
