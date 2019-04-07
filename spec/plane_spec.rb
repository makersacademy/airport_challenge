require 'plane'

describe Plane do
  before :each do
    subject { described_class.new }
  end

  describe '#land?' do
    it "chage the plane status to landed" do
      subject.land?
      expect(subject.in_apron).to eq true
    end
  end

  describe '#taken_off?' do
    it "confirm the airplane status as taken off " do
      subject.taken_off?
      expect(subject.in_apron). to eq false
    end
  end
end
