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

end