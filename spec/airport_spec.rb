require 'airport'

describe Airport do
  let(:plane) { double :plane}
  


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
      allow(plane).to receive(:land).with(subject).and_return(plane)
      array = []
      10.times do
        landed_plane = plane.land(subject)
        array << landed_plane
       subject.planes << landed_plane
      end
      expect(subject.planes).to eq array
    end
  end

  describe "#full" do
    it "changes airport status to full if capacity is reached" do
      allow(plane).to receive(:land).with(subject).and_return(plane)
      subject.capacity.times do
        subject.planes << plane.land(subject)
      end
      expect(subject.full).to eq true
    end
  end

end