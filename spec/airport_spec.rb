require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it 'instructs the plane to land' do
      expect(plane).to receive(:land)
      airport.land plane
    end
    it 'has the plane after it has landed' do
      allow(plane).to receive(:land)
      airport.land plane
      expect(airport.planes).to include plane
    end
  end

end
