require_relative '../lib/airport'

describe Airport do
  describe '#land' do
    it 'lands the plane at the airport' do
      ap = Airport.new
      plane = Plane.new
      expect(ap.land(plane)).to eq plane
    end
  end
end
