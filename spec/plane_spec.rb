require 'plane'

describe Plane do

  subject {described_class.new}
  let(:airport) {double :airport}

  before(:each) do
    subject.land
  end

  describe "land method" do

    it "responds to the method call" do
      expect(subject).to respond_to(:land)
    end

    it "lands the plane" do
      expect{subject.land}.to raise_error("#{described_class.name} is already on the ground")
    end

    it "raises error if plane is not flying" do
      expect{subject.land}.to raise_error("#{described_class.name} is already on the ground")
    end
  end

  describe "take_off method" do
    it "responds to the method call" do
      expect(subject).to respond_to(:take_off)
    end

    it "lets the plane to take off" do
      subject.take_off
      expect{subject.take_off}.to raise_error("#{described_class.name} is already flying")
    end

    it "raises error if plane is already flying" do
      subject.take_off
      expect{subject.take_off}.to raise_error("#{described_class.name} is already flying")
    end
  end

end
