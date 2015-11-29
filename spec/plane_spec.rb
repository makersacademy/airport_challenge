require 'plane'

describe Plane do

  describe '#landed' do
    it { is_expected.to respond_to(:landed?) }
    it 'should land a plane' do
      subject.land
      expect(subject.landed?).to eq true
    end
  end

  describe '#taken_off' do
    it { is_expected.to respond_to(:taken_off?) }
    it 'should take off the plane' do
      subject.take_off
      expect(subject.taken_off?).to eq true
    end
  end

end
