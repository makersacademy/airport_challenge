require 'airport'
require 'plane'

describe Airport do
  describe '#land' do
    it 'should land a plane' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to eq [plane]
    end
  end
  describe '#take_off' do
    it 'should take off the plane and confirm its gone' do
      airport = Airport.new
      expect(airport.take_off).to eq []
    end
  end
end
