require 'plane'

describe Plane do
  describe "#initialize" do
    it "assigns a flight number to each new plane" do
      plane = Plane.new(125)
      expect(plane.flight_number).to eq "Flight 125"
    end
  end

  describe "#land" do
    it "lands the plane" do
      plane = Plane.new(10)
      plane.land
      expect(plane.status).to eq "Landed"
    end
  end

  describe "#take_off" do
    it "takes off" do
      plane = Plane.new(10)
      plane.take_off
      expect(plane.status).to eq "Flying"
    end
  end
end
