require 'airport'

describe Airport do
  subject(:airport) { Airport.new }
  let(:weather) { double :weather, condition: "sunny"}
  let(:weather2) { double :weather, condition: "stormy"}
  let(:plane) { double :plane}


  describe "#capacity" do
    it "tests default capacity set to #{Airport::DEFAULT_CAPACITY}" do 
      expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

    it "tests that capacity can be changed to 30" do
      airport.capacity = 30
      expect(airport.capacity).to eq 30
    end
  end

  describe "#planes" do
    it "returns an array of 1 plane after landing" do
      allow(plane).to receive(:land) {plane}
      airport.planes << plane.land(airport, weather)
      expect(airport.planes).to eq [plane]
    end
  end

  describe "#full" do
    it "full returns true if capacity is reached" do
      airport.capacity = 0
      allow(plane).to receive(:land) {plane}
      plane.land(airport, weather)
      expect(airport.full).to eq true
    end
  end
end