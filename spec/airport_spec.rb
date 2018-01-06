require 'airport'

describe Airport do
  subject(:airport) {Airport.new}
  let(:plane){double :plane}

  it {is_expected.to respond_to(:land).with(1).argument}
  describe '#land' do
    it 'stores plane when landed' do
      airport.land(plane)
      expect(airport.plane).to eq plane
    end
  end
end
