require 'plane'

describe Plane do
  describe "#landed?" do
    it "can track whether it is landed or not" do
      expect(subject.landed?).to eq false
    end
  end
  describe "#name" do
    it "can report its own name" do
      expect(subject.name).to_not eq nil
    end
    it "has a name which is set at object creation" do
      plane_2 = Plane.new("plane_2")
      expect(plane_2.name).to eq "plane_2"
    end
  end
end
