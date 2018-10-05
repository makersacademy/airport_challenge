require 'airport'
require 'plane'
describe Airport do
  describe "landing and take off" do
    it "should store landed planes" do
      plane = Plane.new
      subject.receive_plane(plane)
      expect(subject.stored_planes).to eq [plane]
    end
    it "should not store a landed plane after take off" do
      plane = Plane.new
      subject.receive_plane(plane)
      subject.release_plane(plane)
      expect(subject.stored_planes).to eq []
    end
  end

  describe "stormy weather" do
    it "should not allow the plane to take off if it's stormy" do
      plane = Plane.new
      subject.receive_plane(plane)
      subject.report_storm
      subject.release_plane(plane)
      expect(subject.stored_planes).to eq [plane]
    end
    it "should not allow the plane to land if it's stormy" do
      plane = Plane.new
      subject.report_storm
      subject.receive_plane(plane)
      expect(subject.stored_planes).to eq []
    end
  end
end
