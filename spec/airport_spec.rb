require 'airport'
describe Airport do
  describe '#land_plane' do
    it "instructs a plane to land at an airport" do
      expect(subject).to receive(:land_plane)
      subject.land_plane
    end

    it "returns a status of landed" do
      plane = double(:plane)
      allow(plane).to receive(:land)
      subject.land_plane plane
      expect(subject.planes).to include plane 
    end
  end
end
