require 'airport'

describe Airport do
  let(:landing_plane) { double :plane, "flying=": false, flying: false}
  let(:takeoff_plane) { double :plane, "flying=": true, flying: true}
  
  describe "#land" do
    it "lets a plane land at an airport" do
      subject.land(landing_plane)
      expect(subject.planes).to include landing_plane
    end

    it "confirms that the plane is no longer flying" do
      subject.land(landing_plane)
      expect(landing_plane.flying).to eq false
    end
  end

  describe "#take_off" do
    it "instructs a plane to take off" do
      subject.land(takeoff_plane)
      subject.take_off(takeoff_plane)
      expect(subject.planes).to_not include takeoff_plane
    end
  end

end
