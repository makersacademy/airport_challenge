require "plane"

describe Plane do

  context "#initialize" do

    it "initializes planes as airbourne" do
      expect(subject).to be_airbourne
    end

  end

  context "#landed" do

    it "Changes airbourne status to false when landing" do
      subject.landed
      expect(subject.airbourne?).to eq false
    end

  end

  context "#taken_off" do

    it "Changes airbourne status to true when taking off" do
      subject.landed
      subject.taken_off
      expect(subject.airbourne?).to eq true
    end

  end

end
