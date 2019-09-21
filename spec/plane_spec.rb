require "plane"

describe Plane do
  describe "#location" do
    it "returns current location of the plane" do
      plane_1 = Plane.new
      expect(plane_1.location).to eq "flying"
    end
  end
end