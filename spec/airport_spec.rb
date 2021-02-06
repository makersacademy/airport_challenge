require 'airport'
require 'plane'

describe Airport do
  it {is_expected.to be_a(Airport)}

  describe '#land' do
    it 'lands a plane' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to eq(airport.hangar)
    end
  end
end
