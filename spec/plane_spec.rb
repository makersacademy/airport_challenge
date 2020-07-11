require 'plane'

describe Plane do
  describe '#land' do
    it 'instruct plane to land at airport, it lands' do
      plane = Plane.new
      airport1 = Airport.new
      airport1.land(plane)
      expect(airport1.airport).to eq [plane]
    end
  end
end
