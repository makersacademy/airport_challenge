require 'airport'

describe Airport do
  describe '#land' do
    it 'should land a plane' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to eq plane
    end
  end

end
