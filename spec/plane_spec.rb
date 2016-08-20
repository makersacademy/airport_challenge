require 'plane'

describe Plane do
  let(:airport) {double :airport}

  describe "land method" do

    it "responds to the method call" do
      expect(subject).to respond_to(:land).with(1).arguments
    end

    it "lands the plane" do
      subject.take_off(airport)
      subject.land(airport)
      expect(subject.flying).to eq false
    end

    it "raises error if plane is not flying" do
      expect{subject.land(airport)}.to raise_error(RuntimeError, "#{described_class.name} is already on the ground")
    end
  end

  describe "take_off method" do
    it "responds to the method call" do
      expect(subject).to respond_to(:take_off).with(1).arguments
    end

    it "lets the plane to take off" do
      subject.take_off(airport)
      expect(subject.flying).to eq true
    end

    it "raises error if plane is already flying" do
      subject.take_off(airport)
      expect{subject.take_off(airport)}.to raise_error(RuntimeError, "#{described_class.name} is already flying")
    end
  end

end
