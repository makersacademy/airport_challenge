require 'airport'

describe Airport do
  subject(:airport) { described_class.new(weather, 20) }
  subject(:airport2) { described_class.new(weather, 10) }
  let(:plane) { double :plane, land: nil, takeoff: nil }
  let(:weather) { double :weather }


  describe '#land' do
    context 'when the weather is not stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end

      it 'lands a plane' do
        expect(plane).to receive(:land)
        airport.land(plane)
      end

      it 'returns a landed plane' do
        airport.land(plane)
        expect(airport.planes).to include plane
      end

      it 'returns an error if the airport if full' do
        20.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error 'Airport is full to capacity'
      end
    end

    context 'when the weather is stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return true
      end

      it 'returns an error if weather is stormy' do
        expect{ airport.land(plane) }.to raise_error "Cannot land due to storm"
      end
    end
  end

  describe '#takeoff' do
    context 'when the weather is not stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end

      it 'takes off a plane' do
        airport.land(plane)
        expect(plane).to receive(:takeoff)
        airport.takeoff(plane)
      end

      it 'removes plane from airport' do
        airport.land(plane)
        airport.takeoff(plane)
        expect(airport.planes).not_to include plane
      end

      it 'raises an error if the plane is not at the airport' do
        airport2.land(plane)
        expect { airport.takeoff(plane) }.to raise_error 'Cannot take off plane, the plane is not at this airport'
      end
    end

    context 'when the weather is stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return true
      end

      it 'will not allow a plane to take off' do
        airport
      expect { airport.takeoff(plane) }.to raise_error "Unable to take off in stormy weather"
    end
    end
  end

  context 'defaults' do
    subject(:new_airport) { described_class.new(weather) }

    it "has a default capacity" do
      allow(weather).to receive(:stormy?).and_return false
      described_class::DEFAULT_CAPACITY.times { new_airport.land(plane) }
      expect { new_airport.land(plane) }.to raise_error 'Airport is full to capacity'
    end
  end
end
