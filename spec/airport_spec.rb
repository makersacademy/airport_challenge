require 'airport'

describe Airport do
  subject(:airport) {Airport.new}
  let(:plane){double :plane}

  it {is_expected.to respond_to(:land).with(1).argument}
  describe '#land' do
    it 'stores plane when landed' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end
  end

  it {is_expected.to respond_to(:take_off).with(1).argument}
  describe '#take_off' do
    it 'removes plane from airport' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).not_to include plane
    end
  end
end
