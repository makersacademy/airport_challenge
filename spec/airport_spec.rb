require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  describe '#land' do
    let(:plane) { double(:plane) }

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'has the plane that is instructed to land' do
      allow(plane).to receive(:land)
      airport.land(plane)
      expect(airport.planes).to include plane
    end
  end
end
