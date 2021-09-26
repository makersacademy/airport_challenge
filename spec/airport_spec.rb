require "airport"

RSpec.describe Airport do
  it "has a default capacity which can be overriden" do
    airport = Airport.new
    expect(airport.capacity).to eq 10
    airport.capacity = 15
    expect(airport.capacity).to eq 15
  end

  describe "#land" do
    it "instructs a plane to land at the airport" do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect(airport.planes).to include(plane)
    end
  end

  describe "#takeoff" do
    it "instructs a plane to take off from the airport" do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      airport.takeoff(plane)
      expect(airport.planes).to_not include(plane)
    end
  end

  describe "#prevent_landing" do
    it "prevents a plane from landing if airport is full" do
      airport = Airport.new
      airport.capacity.times { airport.land(Plane.new) }
      expect { airport.prevent_landing }.to raise_error("Unable to land, airport is full")
    end
  end
end
