require 'plane'

describe Plane do

  describe '#landed' do
    it { is_expected.to respond_to(:landed?) }
    it 'should land a plane' do
      subject.land
      expect(subject.landed?).to eq true
    end
  end

end
