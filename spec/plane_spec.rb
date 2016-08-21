require 'plane'

describe Plane do
  let(:airport) {double :airport}

  describe "land method" do

    it "responds to the method call" do
      expect(subject).to respond_to(:land)
    end

    it "lands the plane" do
      subject.land
      expect{subject.land}.to raise_error("#{described_class.name} is already on the ground")
    end

    it "raises error if plane is not flying" do
      subject.land
      expect{subject.land}.to raise_error("#{described_class.name} is already on the ground")
    end
  end

  describe "take_off method" do
    it "responds to the method call" do
      expect(subject).to respond_to(:take_off)
    end

    it "lets the plane to take off" do
      subject.land
      subject.take_off
      expect{subject.take_off}.to raise_error("#{described_class.name} is already flying")
    end

    it "raises error if plane is already flying" do
      subject.land
      subject.take_off
      expect{subject.take_off}.to raise_error("#{described_class.name} is already flying")
    end
  end

end
