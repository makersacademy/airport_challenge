require 'plane'

describe Plane do
  describe '#land' do
    it 'tells the plane to land' do
      expect(subject.land).to eq "landing"
    end
  end
end
