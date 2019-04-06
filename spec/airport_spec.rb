require 'airport'

describe Airport do

  describe "#land_plane" do
    it "allows a plane to land" do
      it {is_expected.to respond_to(:land_plane)}
    end
  end
end
