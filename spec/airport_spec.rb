require 'airport'

describe Airport do

  subject(:airport) { described_class.new}

  describe '#land_plane' do
    it 'a plane will land at the airport and enter the hanger' do
      plane = double(:plane)
      airport.land_plane(plane)
      expect(airport.hanger).to include plane
    end
  end
end
