require 'planes'

describe Planes do
  describe "#landed" do
    it "should land a plane" do
      subject.landed
      expect(subject.at_airport?).to eq true
    end
  end
  describe "#taken_off" do
    it "should take off a plane" do
      plane = Planes.new
      plane.landed
      plane.taken_off
      expect(subject.at_airport?).to eq false
    end
  end
end
