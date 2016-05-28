require 'airport'

describe Airport do

  let(:plane) {double("plane")}
  let(:plane2) {double("plane2")}

  describe "#plane_arrival" do
    it "should receive a plane when plane is landed" do
      airport = Airport.new
      allow(plane).to receive(:at_airport?) {false}
      expect(airport.plane_arrival(plane)).to eq [plane]
    end

    it "should not allow landing of a plane when the airport is full" do
      airport = Airport.new(1)
      allow(plane).to receive(:at_airport?) {false}
      allow(plane2).to receive(:at_airport?) {false}
      airport.plane_arrival(plane)
      expect{airport.plane_arrival(plane2)}.to raise_error("The airport terminal is full")
    end
  end

  describe "#plane_departure" do
    it "should have an empty terminal when the only plane takes off" do
      airport = Airport.new
      allow(plane).to receive(:at_airport?) {false}
      airport.plane_arrival(plane)
      allow(plane).to receive(:at_airport?) {true}
      expect(airport.plane_departure).to eq plane
    end

    it "should have a terminal with one less plane, when one of the planes takes off" do
      airport = Airport.new
      allow(plane).to receive(:at_airport?) {false}
      allow(plane2).to receive(:at_airport?) {false}
      airport.plane_arrival(plane)
      airport.plane_arrival(plane2)
      allow(plane).to receive(:at_airport?) {true}
      allow(plane2).to receive(:at_airport?) {true}
      airport.plane_departure
      expect(airport.see_terminal).to eq [plane]
    end
  end
end
