require 'plane'

describe Plane do
  describe '#land' do
    it { is_expected.to respond_to(:land) }
    it 'set flying status to false' do
      subject.land
      expect(subject.flying?).to eq false
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }
    it 'set flying status to true' do
      subject.take_off
      expect(subject.flying?).to eq true
    end
  end
end
