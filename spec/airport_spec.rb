require 'airport'

describe Airport do
  airport = Airport.new
  let(:plane) {double("plane")}
  let(:plane2) {double("plane2")}

  describe "#plane_arrival" do
    it "should receive a plane when plane lands" do
      allow(plane).to receive(:at_airport?) {false}
      expect(airport.plane_arrival(plane)).to eq [plane]
    end

    it "should not allow landing of a plane when the airport is full" do
      airport2 = Airport.new(1)
      allow(plane).to receive(:at_airport?) {false}
      allow(plane2).to receive(:at_airport?) {false}
      airport2.plane_arrival(plane)
      expect{airport2.plane_arrival(plane2)}.to raise_error("The airport terminal is full")
    end
  end

  describe "#plane_departure" do
    it "should have an empty terminal when the only plane takes off" do
      allow(plane).to receive(:at_airport?) {false}
      airport.plane_arrival(plane)
      allow(plane).to receive(:at_airport?) {true}
      expect(airport.plane_departure).to eq plane
    end

    it "should raise an error if there are no planes at the terminal to take off" do
      airport3 = Airport.new
      expect{airport3.plane_departure}.to raise_error("There are no planes at the terminal to depart.")
    end
  end
end
