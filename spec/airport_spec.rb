require 'airport'

describe Airport do

  let(:weather) { double :weather, :condition => "sunny"}
  let(:weather2) { double :weather, :condition => "stormy"}

  describe "#capacity" do
    it "responds to capacity method" do
      expect(subject).to respond_to(:capacity)
    end

    it "tests that the default capacity is set to #{Airport::DEFAULT_CAPACITY}" do 
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

    it "tests that the default capacity is set to 30 with passed argument" do
      expect(Airport.new(30).capacity).to eq 30
    end
  end

  describe "#planes" do
    it "returns array of 10 planes which have landed" do
      array = []
      10.times do
        landed_plane = Plane.new.land(subject, weather)
        array << landed_plane
      end
      expect(subject.planes).to eq array
    end
  end

  describe "#full" do
    it "changes airport status to full if capacity is reached" do
      subject.capacity.times do
        Plane.new.land(subject, weather)
      end
      expect(subject.full).to eq true
    end
  end

end