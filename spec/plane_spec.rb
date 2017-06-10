require "plane.rb"

describe Plane do
  let(:plane) { Plane.new }
  describe "#instruct_plane_to_land" do
    it "sends a message to the plane to land" do
      expect(plane.instruct_plane_to_land).to eq true
    end
  end

end
