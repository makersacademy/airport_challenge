require 'airport'

describe Airport do
  subject(:airport) { described_class.new(weather, 20) }
  let(:plane) { double :plane }
  let(:weather) { double :weather }
  # it { is_expected.to respond_to(:land).with(1).argument }
  # it { is_expected.to respond_to(:takeoffplane) }
  # it { is_expected.to respond_to(:capacity) }
  # it { is_expected.to respond_to(:weather) }

  describe '#land' do
    context 'when the weather is not stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end

      it 'lands a plane' do
        expect(airport.land(plane)).to eq [plane]
      end

      it 'returns a landed plane' do
        airport.land(plane)
        expect(airport.planes).to include plane
      end

      it 'returns an error if the airport if full' do
        airport.capacity.times { airport.land(plane) }
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
        expect(airport.takeoff(plane)).to eq plane
      end

      it 'removes plane from airport' do
        airport.land(plane)
        airport.takeoff(plane)
        expect(airport.planes).not_to include plane
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

  # describe 'initialize' do
  #   it 'has a variable capacity' do
  #     airport1 = Airport.new(100)
  #     100.times { airport1.land(plane) }
  #     expect{ airport1.land(plane) }.to raise_error 'Airport is full to capacity'
  #   end
  #
  #   it 'has a default capacity' do
  #     described_class::DEFAULT_CAPACITY.times do
  #       airport.land(plane)
  #     end
  #     expect{ airport.land(plane) }.to raise_error 'Airport is full to capacity'
  #   end
  # end
end
