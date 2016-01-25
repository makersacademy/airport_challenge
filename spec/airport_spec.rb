require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  before do
      allow(airport.weather).to receive(:stormy?).and_return false
  end

  it 'has a default capacity' do
    expect(airport.capacity).to eq described_class::DEFAULT_CAPACITY
  end

  it 'testing' do
    allow(weather).to receive(:stormy?).and_return false
    expect(weather.stormy?).to eq false
  end

  describe '#land' do
    it 'instructs plane to land' do
      expect(plane).to receive(:arrive)
      airport.land(plane)
    end

    before do
      allow(plane).to receive(:arrive)
    end

    it 'returns landed planes' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    it 'raises an error when airport is full' do
      described_class::DEFAULT_CAPACITY.times { airport.land(Plane.new) }
      message = 'Airport is full!'
      expect { airport.land(Plane.new) }.to raise_error message
    end

    it 'raises an error when plane has already arrived' do
      airport.land(plane)
      message = 'Plane has already arrived.'
      expect { airport.land(plane) }.to raise_error message
    end

    context 'when stormy' do
      it 'does not allow plane to land' do
        allow(airport.weather).to receive(:stormy?).and_return true
        message = 'Plane cannot land due to stormy weather.'
        expect { airport.land(plane) }.to raise_error message
      end

      it 'allows plane to land after storm has cleared' do
        allow(airport.weather).to receive(:stormy?).and_return false
        allow(plane).to receive(:arrive)
        expect{ airport.land(plane) }.not_to raise_error
      end
    end
  end

  describe '#takeoff' do
    before do
      allow(weather).to receive(:stormy?).and_return false
      allow(plane).to receive(:arrive)
      allow(plane).to receive(:depart)
    end

    it 'instructs plane to take off' do
      airport.land(plane)
      expect(airport.takeoff(plane)).to eq plane
    end

    it 'removes plane from airport' do
      airport.land(plane)
      airport.takeoff(plane)
      expect(airport.planes).not_to include plane
    end

    it 'raises an error when plane is not at airport' do
      message = 'Plane is not at this airport.'
      expect { airport.takeoff(plane) }.to raise_error message
    end

    context 'when stormy' do
      before do
        airport.land(plane)
      end

      it 'does not allow plane to take off' do
        allow(airport.weather).to receive(:stormy?).and_return true
        message = 'Plane cannot take off due to stormy weather.'
        expect { airport.takeoff(plane) }.to raise_error message
      end

      it 'allows plane to take off after storm has cleared' do
        allow(airport.weather).to receive(:stormy?).and_return false
        allow(plane).to receive(:depart)
        expect{ airport.takeoff(plane) }.not_to raise_error
      end
    end
  end
end