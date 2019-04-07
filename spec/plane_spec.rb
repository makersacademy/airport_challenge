require 'plane'

describe Plane do
  describe '#land' do
    it { expect(subject).to respond_to(:land).with(1).argument }
    it 'should land at an airport' do
      airport = Airport.new
      expect(subject.land(airport)).to eq "The plane has landed at #{airport}"
    end
  end
end
