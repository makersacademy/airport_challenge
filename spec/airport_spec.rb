require "airport"

describe Airport do
  describe "#land" do
    it "should be able to land one plane" do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to eq plane
    end
  end
end