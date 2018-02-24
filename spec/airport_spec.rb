require 'airport'
require 'plane'

describe Airport do
  describe '#land' do
    it 'should land a plane' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to match_array [plane]
    end
  end

end
