require 'plane'

RSpec.describe Plane do

  context "on initializing" do
    it "has a landed attribute" do
      expect(subject).to respond_to(:landed).with(0).argument
    end

    it "is in the air" do
      # This is so that planes can be landed when they are initialized
      expect(Plane.new.landed).to eq false
    end
  end

  context "when checking landed status" do
    it "responds with a boolean value" do
      expect([true, false].include?(subject.landed)).to eq true
    end
  end

  context "when instructed to take off" do
    it "updates the landed attribute" do
      subject.land
      expect(subject.landed).to eq true
    end
  end

  context "when instructed to land" do
    it "updates the landed attribute" do
      subject.take_off
      expect(subject.landed).to eq false
    end
  end

end
