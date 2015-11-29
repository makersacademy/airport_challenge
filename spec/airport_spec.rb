require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
    before do
      allow(airport.send(:weather)).to receive(:stormy?) { false }
    end
    it 'instructs the plane to land when weather is not stormy' do
      expect(plane).to receive(:land)
      airport.land plane
    end
    it 'has the plane after it has landed' do
      allow(plane).to receive(:land)
      airport.land plane
      expect(airport.planes).to include plane
    end
    it 'does not allow the plane to land when weather is stormy' do
      allow(plane).to receive(:land)
      allow(airport.send(:weather)).to receive(:stormy?) { true }
      message = 'Unable to land due to stormy weather'
      expect { airport.land plane }.to raise_error message
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    before do
      allow(airport.send(:weather)).to receive(:stormy?) { false }
      allow(plane).to receive(:land)
      airport.land plane
    end
    it 'instructs the plane to take off when weather is not stormy' do
      expect(plane).to receive(:take_off)
      airport.take_off plane
    end
    it 'does not have the plane after it took off' do
      allow(plane).to receive(:take_off)
      airport.take_off plane
      expect(airport.planes).not_to include plane
    end
    it 'does not allow the plane to take off when weather is stormy' do
      allow(plane).to receive(:take_off)
      allow(airport.send(:weather)).to receive(:stormy?) { true }
      message = 'Unable to take off due to stormy weather'
      expect { airport.take_off plane }.to raise_error message
    end
  end

end
