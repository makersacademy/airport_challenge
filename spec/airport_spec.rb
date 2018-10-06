require 'airport'

describe Airport do

  describe '#landing' do
    it 'allows planes to land' do
      airport = Airport.new
      plane = Plane.new
      weather = Weather.new
      expect(airport.land(plane)).to eq plane
    end
  end
end
