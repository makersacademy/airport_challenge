require 'airport'

describe Airport do
  subject(:airport) { Airport.new }
  let(:plane) { double :plane }

  it { is_expected.to respond_to(:planes) }

  describe '#land' do

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'allows a plane to land at the airport' do
      allow(airport).to receive(:bad_weather).and_return false
      allow(plane).to receive(:landed)
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    it 'prevents a plane from landing when weather is stormy' do
      allow(airport).to receive(:bad_weather).and_return true
      expect { airport.land(plane) }.to raise_error "Cannot land due to stormy weather"
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'allows a plane to take off from the airport' do
      allow(airport).to receive(:bad_weather).and_return false
      allow(plane).to receive(:take_off)
      airport.take_off(plane)
      expect(airport.planes).to eq([])
    end

    it 'prevents a plane from taking off when weather is stormy' do
      allow(airport).to receive(:bad_weather).and_return true
      expect { airport.take_off(plane) }.to raise_error "Cannot take off due to stormy weather"
    end
  end
end
