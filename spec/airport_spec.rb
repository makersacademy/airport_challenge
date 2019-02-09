require "./lib/airport"

describe Airport do

  context "landing a plane" do
    it "responds to #land_plane" do
      expect(subject).to respond_to :land_plane
    end
  end

end