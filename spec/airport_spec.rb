require 'airport'

describe Airport do

  describe "#instruct_plane_to_land" do
    it "instructs plane to land at the airport" do
      airport = Airport.new

      expect(airport).to respond_to :land_plane
    end
  end

end