require_relative '../lib/airport'

describe Airport do
  describe '#land' do
    it 'lands the plane at the airport' do
      ap = Airport.new
      plane = Plane.new
      expect(ap.land(plane)).to match_array [plane]
    end
  end

  describe '#takeoff' do
    it 'lets the plane takeoff from the airport and check it has left' do
      ap = Airport.new
      plane = Plane.new
      ap.land(plane)
      ap.takeoff
      expect(ap.status).to eq "There are 0 planes here"
    end
  end

  describe '#status' do
    it 'returns no planes parked at airport' do
      ap = Airport.new
      expect(ap.status).to eq "There are 0 planes here"
    end

    it 'returns one plane at the airport' do
      ap = Airport.new
      plane = Plane.new
      ap.land(plane)
      expect(ap.status).to eq "There are 1 planes here"
    end
  end

end
