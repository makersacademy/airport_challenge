require "airport"

describe Airport do
  describe "#land" do
    it "responds to 'land' method" do
      expect(subject).to respond_to(:land)
    end
    it "should store the plane in the airport" do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to eq plane
    end
  end
end
