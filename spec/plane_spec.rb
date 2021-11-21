require 'plane'

describe Plane do
  describe '#land' do
    it 'should land plane in specified airport' do
      airport = Airport.new
      plane = Plane.new

      plane.land(airport)

      expect(plane.location).to eq(airport)

    end
  end
end
