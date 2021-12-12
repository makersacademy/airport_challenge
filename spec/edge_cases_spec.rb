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

describe 'planes that are already flying cannot take off or be in an airport' do
  describe '#takeoff' do
    it 'raises an error if the plane is already in flight' do
      plane = Plane.new
      expect { plane.takeoff }.to raise_error("Cannot Takeoff From The Sky")
    end
  end
end

describe 'planes that are landed cannot land again and must be in an airport' do
  describe '#land' do 
    it 'raises an error if already landed' do 
      plane = Plane.new
      han = Airport.new
      allow(Weather).to receive(:report) { "Blue Skies Ahead" }
      plane.land(han)
      expect { plane.land(han) }.to raise_error("Already Landed")
    end
    it 'results in the plane being in the airport' do
      plane = Plane.new
      lax = Airport.new
      allow(Weather).to receive(:report) { "Blue Skies Ahead" }
      plane.land(lax)
      expect(lax.hangar.include?(plane)).to eq(true)
    end
  end
end
