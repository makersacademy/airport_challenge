require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#land' do
    it 'instructs a plane to land at the airport itself' do
      expect(plane).to receive(:land_at).with(airport)
      airport.land plane
    end

    it 'contains the landed plane' do
      allow(plane).to receive(:land_at).with(airport)
      airport.land plane
      expect(airport.planes).to include plane
    end
  end

end
