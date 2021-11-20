require 'airport'
require 'plane'

describe Airport do
  let(:gatwick) { described_class.new }
  let(:wings) { Plane.new }
  
  context "land" do
    it "instruct a plane to land" do
      expect(gatwick).to respond_to(:land).with(1).argument
    end
    it "land a plane in the airport" do
      expect(gatwick.land(wings)).to eq [wings]
    end
  end

  context "take off" do
    it "instruct a plane to take off" do
      expect(gatwick).to respond_to(:departure)
    end
    it "confirms that the plane is no longer in the airport" do
      gatwick.land(wings)
      departing_plane = gatwick.landed[0]
      gatwick.departure
      expect(gatwick.landed).not_to include(departing_plane)
    end
  end

end