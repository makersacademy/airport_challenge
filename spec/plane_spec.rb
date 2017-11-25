require "plane"

describe Plane do

  describe "#land" do
    before do
      subject.land
    end
    it "should set the status to landed = true" do
      expect(subject.landed).to eq true
    end
  end

  describe "#take_off" do
    before do
      subject.take_off
    end
    it "should set the status to landed = false" do
      expect(subject.landed).to eq false
    end
  end

end
