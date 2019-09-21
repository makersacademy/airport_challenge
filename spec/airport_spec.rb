require 'airport'

describe Airport do
  describe "#land" do
    it "instructs plane to land at the airport" do
      gatwick = Airport.new
      plane_1 = Plane.new
      expect(gatwick.land(plane_1)).to eq "roger wilko"
    end
  end

  describe "#take_off" do
    it "instructs a plane to take_off and returns confirmation" do
      gatwick = Airport.new
      plane_1 = Plane.new
      expect(gatwick.take_off(plane_1)).to eq "In the air"
    end
  end
end
