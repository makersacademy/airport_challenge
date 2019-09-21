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
      gatwick.land(plane_1)
      expect(gatwick.take_off(plane_1)).to eq "In the air"
    end

    it "it raises error if plane not at that airport" do
      gatwick = Airport.new
      heathrow = Airport.new
      plane_1 = Plane.new
      gatwick.land(plane_1)
      expect{heathrow.take_off(plane_1)}.to raise_error
    end
  end
end
