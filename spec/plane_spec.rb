require "plane"

describe Plane do
  describe "#change_location" do
    it "changes the location of the plane" do
      subject.change_location("in air")
      expect(subject.location).to eq "in air"
    end
    it "pushes the plane to the planes array from Airport" do
      lhr = Airport.new
      ba = Plane.new
      ba.change_location(lhr)
      expect(lhr.planes).to eq [ba]
    end
  end
end
