require "./lib/airport"

describe Airport do

  context "landing a plane" do

    it "responds to #land_plane" do
      expect(subject).to respond_to :land_plane
    end

    it "lands a plane and stores it in its hangar" do
      plane = Plane.new
      expect(subject.land_plane(plane)).to eq [plane]
    end

  end

  context "getting a plane to take-off" do

    it "responds to #takeoff_plane" do
      expect(subject).to respond_to :takeoff_plane
    end

    it "allows a plane to take-off from its hangar and confirm it is no longer in the airport" do
      plane = Plane.new
      subject.land_plane(plane)
      plane = subject.takeoff_plane
      expect(subject.hangar).not_to include plane
    end

  end

end
