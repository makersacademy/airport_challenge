require 'plane'
require 'airport'

describe Plane do
  subject(:plane) { described_class.new }
  airport = Airport.new

  describe '#landed?' do
    it 'confirms that the plane has landed' do
      airport.land(plane)
      expect(plane.landed?(airport)).to be_truthy
    end
  end

end
