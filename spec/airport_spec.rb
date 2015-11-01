require 'airport.rb'

describe Airport do
  subject(:airport) { described_class.new(weather, 20) }
  let(:plane) { double :plane, land:nil, take_off:nil }
  let(:weather) { double :weather }

    describe '#land' do

      context 'when not stormy' do
        before do
          allow(weather).to receive(:stormy?).and_return false
        end
        it 'instructs a plane to land' do
          expect(plane).to receive(:land)
          airport.land(plane)
        end

        context 'when full' do
          it 'raises an error' do
            20.times do
              airport.land(plane)
            end
            expect { airport.land(plane) }.to raise_error 'Cannot land plane: airport full'
          end
        end
      end

      context 'when stormy' do
        it 'raises an error if asked to land a plane ' do
          allow(weather).to receive(:stormy?).and_return true
          expect { airport.land(plane) }.to raise_error 'Cannot land plane: weather is stormy'
        end
      end
    end


  describe '#take_off' do
    context 'when not stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end

      it 'instruct a plane to take off' do
        airport.land(plane)
        expect(plane).to receive(:take_off)
        airport.take_off(plane)
      end

      it 'return the plane that took off' do
        airport.land(plane)
        expect(airport.take_off(plane)) .to eq plane
      end

      it 'raise and error if plain not at the airport' do
        airport_2 = described_class.new(weather, 20)
        airport_2.land(plane)
        expect{ airport.take_off(plane) }.to raise_error 'Cannot take off plane: the plane is not at this airport'
      end
    end

    context 'when stormy' do
      it 'raises an error if asked to take off a plane' do
        allow(weather).to receive(:stormy?).and_return true
        expect { airport.take_off(plane) }.to raise_error 'Cannot take off plane: weather is stormy'
      end
    end
  end

  describe '#planes' do
    before do
      allow(weather).to receive(:stormy?).and_return false
    end

    it 'returns planse at the airport' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    it 'does not return planes that have take off' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).not_to include plane
    end
  end

  context 'defaults' do
    subject(:default_airport) { described_class.new(weather) }

    it 'has a default capacity' do
      allow(weather).to receive(:stormy?).and_return false
      described_class::DEFAULT_CAPACITY.times { default_airport.land(plane) }
      expect{ default_airport.land(plane) }.to raise_error 'Cannot land plane: airport full'
    end
  end
end
