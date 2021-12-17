require 'plane'

describe Plane do
  it { is_expected.to respond_to(:land).with(1).argument }
  describe '#land' do
    it 'lands at an airport' do
      airport = Airport.new
      # plane = Plane.new
      expect(subject.land(airport)).to eq airport  
    end
  end
end
