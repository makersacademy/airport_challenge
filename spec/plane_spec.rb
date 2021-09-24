require 'plane'

describe Plane do
  describe "#initialize" do
    it "assigns a flight number to each new plane" do
      plane = Plane.new(125)
      expect(plane.flight_number).to eq "Flight 125"
    end
  end
end
