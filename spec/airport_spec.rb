require 'airport'

describe Airport do
  describe "#receives_plane" do
    it "should receive a plane when plane is landed" do
      airport = Airport.new
      plane = double("plane", :at_airport? => true)
      expect(airport.receives_plane(plane)).to eq [plane]
    end
  end
  describe "#releases_plane" do
    it "should have an empty terminal when plane takes off" do
      airport = Airport.new
      plane = double("plane", :at_airport? => false)
      airport.terminal = [plane]
      airport.releases_plane
      expect(airport.terminal).to eq []
    end
  end
end
