require 'airport'

describe Airport do
  let(:plane) {double("plane")}
  let(:plane2) {double("plane2")}
  let(:plane3) {double("plane3")}

  describe "#plane_arrival" do
    it "should receive a plane when plane lands" do
      airport = Airport.new
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
      airport3 = Airport.new
      allow(plane3).to receive(:at_airport?) {false}
      airport3.plane_arrival(plane3)
      allow(plane3).to receive(:at_airport?) {true}
      expect(airport3.plane_departure(plane3)).to eq plane3
    end

    it "should release a specific plane from the terminal" do
      airport4 = Airport.new
      allow(plane2).to receive(:at_airport?) {false}
      allow(plane).to receive(:at_airport?) {false}
      airport4.plane_arrival(plane2)
      airport4.plane_arrival(plane)
      allow(plane2).to receive(:at_airport?) {true}
      allow(plane).to receive(:at_airport?) {true}
      expect(airport4.plane_departure(plane2)).to eq plane2
      expect(airport4.see_terminal).to eq [plane]
    end

    it "should raise an error if there are no planes at the terminal to take off" do
      airport5 = Airport.new
      expect{airport5.plane_departure(plane)}.to raise_error("There are no planes at the terminal to depart.")
    end
  end
end
