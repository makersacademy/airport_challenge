require 'plane'
require 'airport'

describe Plane do
  subject(:plane) { described_class.new }
  airport = Airport.new

  describe '#land' do
    it 'allows a plane to land' do
      expect(plane.land(airport)).to eq [plane]
    end
  end

end
