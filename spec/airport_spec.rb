require 'airport'

describe Airport do
  describe '#land_plane' do
    it 'lands a plane' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land_plane).to eq airport.gates << plane
    end
  end
end
