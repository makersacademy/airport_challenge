require 'airport'
describe Airport do
  describe "initialization" do
    it "defaults capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it "can be set a different capacity" do
      expect(Airport.new(100).capacity).to eq 100
    end
    it "should have no planes" do
      expect(subject.planes).to eq []
    end
  end

  let(:plane)        { double(:plane, flying?: false)}
  let(:flying_plane) { double(:plane, flying?: true)}

  describe "#add" do
    it "should raise an error when adding a flying plane to airport" do
      expect {subject.add(flying_plane)}.to raise_error "Cannot add flying planes to airport"
    end
    it "should add a landed plane to airport" do
      expect(subject.add(plane)).to eq [plane]
    end
  end
end
