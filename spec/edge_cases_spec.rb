require 'airport'
require 'plane'

describe 'planes can only take off from airports they are in' do 
  describe '#takeoff' do 
    it 'releases the plane from the airport it is in' do
      plane = Plane.new
      bkk = Airport.new
      allow(Weather).to receive(:report) { "Blue Skies Ahead" }
      plane.land(bkk)
      expect(bkk.hangar.include?(plane)).to eq true
      plane.takeoff
      expect(bkk.hangar.include?(plane)).to eq false
    end
  end
end

# planes that are already flying cannot take off or be in an airport
# planes that are landed cannot land again and must be in an airport
