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
  end

  describe "#plane" do
    it "responds to #plane" do
      expect(subject).to respond_to :plane
    end
    it "saves one plane that is landed" do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.plane).to eq plane
    end
  end

  describe "#in_airport?" do
    it "responds to in_airport?" do
      expect(subject).to respond_to :in_airport?
    end
    it "returns false if plane is not in the airport" do
      plane = Plane.new
      expect(subject.in_airport?(plane)).to eq false
    end
    it "returns true if plane is in the airport" do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.in_airport?(plane)).to eq true
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
