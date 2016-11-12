require 'airport'

describe Airport do

  describe "#land_plane" do
    it "responds to land_plane" do
      expect(subject).to respond_to :land_plane
    end
    it "allows controller to land a plane" do
      plane = Plane.new
      expect(subject.land_plane(plane)).to eq true
    end
    # it "returns the landed plane" do
    #   plane = Plane.new
    #   expect(subject.land_plane(plane)).to eq plane
    # end
  end

  describe "#landed?" do
    it "responds to landed?" do
      expect(subject).to respond_to :landed?
    end
    it "returns if a plane has landed" do
      plane = Plane.new
      expect(subject.landed?(plane)).to eq true
    end
  end






end
