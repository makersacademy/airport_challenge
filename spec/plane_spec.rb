require 'plane'

describe Plane do
  it { is_expected.to respond_to(:landed) }
  it { is_expected.to respond_to(:airborne) }
  it { is_expected.to respond_to(:takeoff) }

  describe '#landed' do
    it 'should change flight airborne status upon landing' do
      subject.landed
      expect(subject.airborne?).to eq false
    end
  end

  describe '#takeoff' do
    it 'should change flight airborne status upon takeoff' do
      subject.landed
      subject.takeoff
      expect(subject).to be_airborne
    end
  end

end
