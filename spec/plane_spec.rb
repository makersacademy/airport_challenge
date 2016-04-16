require 'plane'

describe Plane do
  it { is_expected.to respond_to :ground}
  it { is_expected.to respond_to :land}
  it { is_expected.to respond_to :takeoff}

  describe '#land' do
    it 'changes status when landing' do
      subject.takeoff
      subject.land
      expect(subject.ground).to eq true
    end
  end

  describe '#takeoff' do
    it 'changes status when taking off' do
      subject.land
      subject.takeoff
      expect(subject.ground).to eq false
    end
  end

  describe '#ground?' do
    it 'starts in the air' do
      expect(subject.ground).to eq false
    end
  end

end
