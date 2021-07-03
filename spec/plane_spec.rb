require 'plane'

describe Plane do 
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it "should leave airport" do
      subject.take_off
      expect(subject.airport).to eq('In flight')
    end
  end

  describe '#airport' do
    it "should declare which airport it is at" do
      airport = double(:airport)
      subject.land(airport)
      expect(subject.airport).to eq(airport)
    end

    it "should declare it is in flight if not in airport" do
      expect(subject.airport).to eq('In flight')
    end
  end
end
