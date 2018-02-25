require 'airport'

describe Airport do
  subject(:airport) { described_class.new(weather, 20) }
  subject(:other_airport) { described_class.new(weather, 20) }
  subject(:default_airport) { described_class.new(weather) }
  let(:plane) { double :plane, instruct_landing: nil, instruct_take_off: nil }
  let(:weather) { double :weather }

  describe '#instruct_landing' do
    context 'when weather not stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end

      it 'instructs plane to land' do
        expect(plane).to receive(:instruct_landing)
        airport.instruct_landing(plane)
      end

      context 'when full' do
        it 'does not allow plane to land' do
          20.times { airport.instruct_landing(plane) }
          expect { airport.instruct_landing(plane) }.to raise_error 'Plane cannot land. Airport is full'
        end
      end
    end

    context 'when weather stormy' do
      it 'does not allow plane to land' do
        allow(weather).to receive(:stormy?).and_return true
        expect { airport.instruct_landing(plane) }.to raise_error 'Plane cannot land due to stormy weather'
      end
    end
  end

  describe '#instruct_take_off' do
    context 'when weather not stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end

      it 'instructs plane to take off' do
        airport.instruct_landing(plane)
        expect(plane).to receive(:instruct_take_off)
        airport.instruct_take_off(plane)
      end

      it 'returns plane that took off' do
        airport.instruct_landing(plane)
        expect(airport.instruct_take_off(plane)).to eq plane
      end

      it 'raises an error if plane is not at this specific airport' do
        other_airport.instruct_landing(plane)
        expect { airport.instruct_take_off(plane) }.to raise_error 'Plane cannot take off. Plane at another airport'
      end
    end

    context 'when weather stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return true
      end

      it 'instructs plane not to take off' do
        expect { airport.instruct_take_off(plane) }.to raise_error 'Plane cannot take off due to stormy weather'
      end
    end

    describe '#planes' do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end

      it 'returns planes at the airport' do
        airport.instruct_landing(plane)
        expect(airport.planes).to include plane
      end

      it 'does not return planes that took off' do
        airport.instruct_landing(plane)
        airport.instruct_take_off(plane)
        expect(airport.planes).not_to include plane
      end
    end

    context 'defaults' do
      it 'has a default capacity' do
        allow(weather).to receive(:stormy?).and_return false
        described_class::DEFAULT_CAPACITY.times { default_airport.instruct_landing(plane) }
        expect { default_airport.instruct_landing(plane) }.to raise_error 'Plane cannot land. Airport is full'
      end
    end
  end
end
