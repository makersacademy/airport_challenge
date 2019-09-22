require 'airport'

describe Airport do

  subject(:airport) { described_class.new}

  describe '#land_plane' do
    it 'A plane will land at the airport and enter the hanger' do
      plane = double(:plane)
      airport.land_plane(plane)
      expect(airport.hanger).to include plane
    end
  end

  describe '#takeoff_plane' do
      it 'A plane will take off and be removed from the airport hanger' do
        plane = double(:plane)
        airport.hanger << plane
        airport.takeoff_plane(plane)
        expect(airport.hanger).to_not include plane
      end
    end

end
