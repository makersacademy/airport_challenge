require 'airport'
describe Airport do
  describe "#land" do
    it "should accept a plane landing" do
      plane = double(:my_plane)
      expect(subject.land(plane)).to eq plane
    end
  end
end
