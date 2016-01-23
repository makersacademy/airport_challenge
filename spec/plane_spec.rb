require 'plane'

describe Plane do

  describe '#land' do
    it { is_expected.to respond_to(:land) }

    it 'has landed' do
      subject.land
      expect(subject.landed).to eq true
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'is no longer in land' do
      subject.take_off
      expect(subject.take_off).to eq false
    end
  end
end
