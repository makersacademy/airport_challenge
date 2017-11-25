require 'airport'
describe Airport do
  describe "#land" do
    it "should accept a plane landing" do
      plane = double(:my_plane)
      subject.land(plane)
      expect(subject.planes.include?(plane)).to be true
    end
  end
end
