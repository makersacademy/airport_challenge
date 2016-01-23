require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double(:plane) }

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'has the plane that is instructed to land' do
      allow(plane).to receive(:land)
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    it 'raises error, prevent land on stormy weather' do
      allow(weather).to receive(:stormy?).and_return(true)
      allow(plane).to receive(:land)
      expect { airport.land(plane) }.to raise_error('Cannot land on a storm!')
    end
  end

  describe '#take_off' do

    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'no longer has the plane that is instructed to take off' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).not_to include plane
    end
  end
end
