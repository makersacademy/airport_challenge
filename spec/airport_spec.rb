require 'airport'

describe Airport do

  let(:plane) {double("plane")}

  describe "#plane_arrival" do
    it "should receive a plane when plane is landed" do
      airport = Airport.new
      allow(plane).to receive(:at_airport?) {true}
      expect(airport.plane_arrival(plane)).to eq [plane]
    end
  end
  describe "#plane_departure" do
    it "should have an empty terminal when plane takes off" do
      airport = Airport.new
      allow(plane).to receive(:at_airport?) {false}
      airport.terminal = [plane]
      airport.plane_departure
      expect(airport.terminal).to eq []
    end
  end
end
