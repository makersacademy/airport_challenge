require 'plane'

describe Plane do
  let(:airport) { double(:Airport) }

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument}
  end

  describe '#landed?' do
    it { is_expected.to respond_to(:landed?) }

    it 'displays that it has landed when at an airport' do
      subject.land airport
      expect(subject).to be_landed
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'is no longer at an airport' do
      subject.land airport
      subject.take_off
      expect(subject).not_to be_landed
    end
  end
end
