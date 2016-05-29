require 'planes'

describe Plane do

  plane = Plane.new
  plane2 = Plane.new
  plane3 = Plane.new
  let(:traffic_control) {double("traffic_control")}

  describe "#land" do
    it "should land a plane if traffic control granted permission" do
      allow(traffic_control).to receive(:permission?) {true}
      plane.land(traffic_control)
      expect(plane.at_airport?).to eq true
    end

    it "should not land a plane if traffic_control did not grant permission" do
      allow(traffic_control).to receive(:permission?) {false}
      plane2.land(traffic_control)
      expect(plane2.at_airport?).to eq false
    end

    it "should not land a plane if it has already landed" do
      allow(traffic_control).to receive(:permission?) {true}
      plane3.land(traffic_control)
      expect{plane3.land(traffic_control)}.to raise_error("Plane has already landed.")
    end
  end

  describe "#take_off" do

    it "should not take off a plane if traffic_control did not grant permission" do
      allow(traffic_control).to receive(:permission?) {false}
      plane.take_off(traffic_control)
      expect(plane.at_airport?).to eq true
    end

    it "should take off a plane if traffic control granted permission" do
      allow(traffic_control).to receive(:permission?) {true}
      plane.take_off(traffic_control)
      expect(plane.at_airport?).to eq false
    end

    it "should not take off a plane if the plane has taken off" do
      allow(traffic_control).to receive(:permission?) {true}
      plane3.take_off(traffic_control)
      expect{plane3.take_off(traffic_control)}.to raise_error("Plane has already taken off.")
    end
  end
end
