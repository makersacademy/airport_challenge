require 'plane'

describe Plane do

  describe '#land' do
    it 'should land a plane' do
      subject.land
      expect(subject.landed?).to eq true
    end
  end

  describe '#take_off' do
    it 'should take off the plane' do
      subject.take_off
      expect(subject.taken_off?).to eq true
    end
  end

end
