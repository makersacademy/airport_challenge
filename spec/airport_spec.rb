require "airport"
require "plane"

describe Airport do

  describe "#airstrip_land" do
    it "allows planes to land" do
      plane = Plane.new
      subject.airstrip_land(plane)
      expect(subject.planes).to include(plane)
    end
  end

  describe "#airstrip_take_off" do
    it "allows planes to take off" do
      plane = Plane.new
      subject.planes << plane
      subject.airstrip_take_off(plane)
      expect(subject.planes).to_not include(plane)
    end
  end

end
