require 'airport'

describe Airport do
  subject(:airport) { described_class.new(weather, 20) }
  let(:plane) { double :plane, land: nil, take_off: nil }
  let(:weather) { double :weather}

  describe "#land" do
    context 'when not stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end

      it "adds the plane to the hangar" do
        expect(plane).to receive(:land)
        airport.land(plane)
      end

    context 'when full' do
      it 'raises an error' do
        20.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error 'Hangar is full, cannot land'
      end
    end
  end

    context 'when stormy' do
        it 'raises an error' do
          allow(weather).to receive(:stormy?).and_return true
          expect { airport.land(plane) }.to raise_error 'There is a storm, cannot land'
        end
      end
    end

  describe "#take_off" do
    context 'when not stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end

      it 'instructs the plane to take off' do
        airport.land(plane)
        expect(plane).to receive(:take_off)
        airport.take_off(plane)
      end

      it 'returns the plane that took off' do
        airport.land(plane)
        expect(airport.take_off(plane)).to eq plane
      end

      it 'raises an error if plane is not at this airport' do
        other_airport = described_class.new(weather, 20)
        other_airport.land(plane)
        expect { airport.take_off(plane) }.to raise_error "Error: Plane not at this airport"
      end
    end

    context 'when stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return true
      end

      it 'raises an error' do
        expect { airport.take_off(plane) }.to raise_error "There is a storm, can't take off"
      end
    end
  end

  describe '#hangar' do
    before do
      allow(weather).to receive(:stormy?).and_return false
    end

    it 'returns planes at the airport' do
      airport.land(plane)
      expect(airport.hangar).to include plane
    end

    it 'does not return planes that have taken off' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.hangar).not_to include plane
    end

    context 'defaults' do
      subject(:default_airport) { described_class.new(weather) }

      it 'has a default capacity' do
        allow(weather).to receive(:stormy?).and_return false
        described_class::DEFAULT_CAPACITY.times { default_airport.land(plane) }
        expect { default_airport.land(plane) }.to raise_error "Hangar is full, cannot land"
      end
    end
  end
end
