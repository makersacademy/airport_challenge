require 'airport'

describe Airport do

  describe "#let_plane_land" do
    it "checks plane has landed in airport" do
      plane = Plane.new
      subject.let_plane_land(plane)
      expect(subject.planes.last).to eq plane
    end
  end

  describe "#take_off" do

    it "checks plane has taken off from airport" do
      plane = Plane.new
      subject.let_plane_land(plane)
      expect(subject.take_off).to eq plane
    end

    it "checks plane is no-longer in airport" do
      plane = Plane.new
      subject.let_plane_land(plane)
      subject.take_off
      expect(subject.planes.include?(plane)).to eq false
    end

  end

end
