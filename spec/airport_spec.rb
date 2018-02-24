require_relative '../lib/airport'

describe Airport do
  describe '#land' do
    it 'lands the plane at the airport' do
      ap = Airport.new
      plane = Plane.new
      expect(ap.land(plane)).to eq plane
    end
  end
  describe '#takeoff' do
    it 'lets the plane takeoff from the airport' do
      ap = Airport.new
      plane = Plane.new
      expect(ap.takeoff(plane)).to eq plane
    end
  end
end
