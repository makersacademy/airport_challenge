require 'plane'

describe Plane do
  describe '#land' do
    it 'land plane' do
      subject.land
      expect(subject.grounded?).to be_truthy
    end
  end

end
