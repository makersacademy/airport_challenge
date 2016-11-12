require 'airport'

describe Airport do

  describe "#land_plane" do
    it "responds to #land_plane" do
      expect(subject).to respond_to :land_plane
    end
    it "returns a landed plane" do
      plane = Plane.new
      expect(subject.land_plane(plane)).to eq plane
    end
    it "responds to #plane" do
      expect(subject).to respond_to :plane
    end
  end

  describe "#landed?" do
    it "responds to landed?" do
      expect(subject).to respond_to :landed?
    end
    it "returns the plane we are checking" do
      plane = Plane.new
      expect(subject.landed?(plane)).to eq plane
    end
  end

  describe "#takeoff" do
    it "responds to takeoff" do
      expect(subject).to respond_to :takeoff
    end
    it "instructs a plane to takeoff" do
      plane = Plane.new
      expect(subject.takeoff(plane)).to eq true
    end
  end






end
