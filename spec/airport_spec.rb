require 'airport'

describe Airport do

  let(:weather) { double :weather, condition: "sunny"}
  let(:weather2) { double :weather, condition: "stormy"}
  let(:plane) { double :plane}


  describe "#capacity" do
    it "tests default capacity set to #{Airport::DEFAULT_CAPACITY}" do 
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

    it "tests that capacity can be changed to 30" do
      subject.capacity = 30
      expect(subject.capacity).to eq 30
    end
  end

  describe "#planes" do
    it "returns an array of 1 plane after landing" do
      allow(plane).to receive(:land) {plane}
      subject.planes << plane.land(subject, weather)
      expect(subject.planes).to eq [plane]
    end
  end

  describe "#full" do
    it "full returns true if capacity is reached" do
      subject.capacity = 0
      allow(plane).to receive(:land) {plane}
      plane.land(subject, weather)
      expect(subject.full).to eq true
    end
  end
end