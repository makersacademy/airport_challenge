require 'airport'

describe Airport do
  describe '#land(plane)' do
    it 'should take in a plane when a plane is instructed to land' do
      plane = Plane.new
      airport = Airport.new
      expect(airport.land(plane)).to eq plane
    end
  end
end

  describe
