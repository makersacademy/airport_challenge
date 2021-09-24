require 'airport'
require 'plane'

describe Airport do
  describe "#land" do
    before(:each) do
      @plane = Plane.new
      subject.land(@plane)
    end

    it "instructs a plane to land at the airport" do
      expect(subject.planes).to include @plane
    end

    it "tells the plane that it is no longer flying" do
      expect(@plane.flying).to eq false
    end
  end

  describe "#take_off" do
    before(:each) do
      @plane = Plane.new
      subject.land(@plane)

      subject.take_off(@plane)
    end

    it "instructs a plane to take off from the airport" do
      expect(subject.planes).to_not include @plane
    end

    it "tells the plane that it is now flying" do
      expect(@plane.flying).to eq true
    end
  end
end