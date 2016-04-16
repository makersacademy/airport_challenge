require 'plane'
require 'airport'

describe Plane do
  it { is_expected.to respond_to :ground}
  it { is_expected.to respond_to :land}
  it { is_expected.to respond_to :takeoff}

  let(:ap) { double(:ap, takeoff: subject.takeoff, land: subject.land)}

  describe '#land' do
    it 'changes status when landing' do
      ap.takeoff(subject)
      
      expect(subject.ground).to eq true
    end
  end

  describe '#takeoff' do
    it 'changes status when taking off' do
      ap.land(subject)
      ap.takeoff(subject)
      expect(subject.ground).to eq false
    end
  end

  describe '#ground?' do
    it 'starts on the ground' do
      expect(subject.ground).to eq true
    end
  end

end
