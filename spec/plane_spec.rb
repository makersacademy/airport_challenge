require 'plane'

describe Plane do
  before :each do
    subject { described_class.new }
  end

  describe '#land?' do
    it { expect(subject.land?).to eq true }
  end

  describe '#taken_off?' do
    it "confirm the airplane status as taken off " do
      subject.taken_off?
      expect(subject.taken_off). to eq true
    end
  end
end
