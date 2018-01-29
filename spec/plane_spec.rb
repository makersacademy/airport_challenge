require "plane"

describe Plane do

  context "#initialize" do

    it "initializes planes as airborne" do
      expect(subject).to be_airborne
    end

  end

  context "#landed" do

    it "Changes airborne status to false when landing" do
      subject.landed
      expect(subject.airborne?).to eq false
    end

  end

  context "#taken_off" do

    it "Changes airborne status to true when taking off" do
      subject.landed
      subject.taken_off
      expect(subject.airborne?).to eq true
    end

  end

end
