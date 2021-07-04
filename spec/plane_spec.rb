require 'plane'

describe Plane do 
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it "should raise an error when airport is full" do
      airport = double(:airport, :full? => true)
      expect { subject.land(airport) }.to raise_error 'Airport is full'
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it "should raise error if in flight" do
      expect { subject.take_off }.to raise_error 'Plane is already in flight'
    end

    it "should say it is in flight after take_off" do
      airport = double(:airport, :full? => false, :plane= => subject)
      subject.land(airport)
      subject.take_off
      expect(subject.airport).to eq('In flight')
    end
  end

  describe '#airport' do
    it "should declare which airport it is at" do
      airport = double(:airport, :full? => false, :plane= => subject)
      subject.land(airport)
      expect(subject.airport).to eq(airport)
    end

    it "should declare it is in flight if not in airport" do
      expect(subject.airport).to eq('In flight')
    end
  end
end
