require 'airport'
require 'plane'

describe Plane do
  describe '#confirm_status' do
    it 'should, upon request, inform controller when landed at airport' do
      airport = Airport.new('Python airport')
      plane1 = Plane.new('CPP091')
      plane2 = Plane.new('RUB091')
      airport.land(plane1)
      airport.land(plane2)
      expect(airport.confirm_status(plane1)).to eq 'CPP091 is at Python airport'
    end
    
    it 'should, upon request, inform controller when in flight' do
    end
  end
end