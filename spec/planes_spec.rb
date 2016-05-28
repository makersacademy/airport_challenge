require 'planes'

describe Plane do

  plane = Plane.new
  plane2 = Plane.new
  plane3 = Plane.new
  let(:weather) {double("weather")}

  describe "#land" do
    it "should land a plane when weather is sunny" do
      allow(weather).to receive(:state) {"sunny"}
      plane.land(weather)
      expect(plane.at_airport?).to eq true
    end

    it "should not land a plane when weather is stormy" do
      allow(weather).to receive(:state) {"stormy"}
      plane2.land(weather)
      expect(plane2.at_airport?).to eq false
    end

    it "should not land a plane if it has already landed" do
      allow(weather).to receive(:state) {"sunny"}
      plane3.land(weather)
      expect{plane3.land(weather)}.to raise_error("Plane has already landed.")
    end
  end

  describe "#take_off" do

    it "should take off a plane if weather is sunny" do
      allow(weather).to receive(:state) {"sunny"}
      plane.take_off(weather)
      expect(plane.at_airport?).to eq false
    end

    it "should not take off a plane if weather is stormy" do
      allow(weather).to receive(:state) {"sunny"}
      plane2.land(weather)
      allow(weather).to receive(:state) {"stormy"}
      plane2.take_off(weather)
      expect(plane2.at_airport?).to eq true
    end

    it "should not take off a plane if the plane has taken off" do
      allow(weather).to receive(:state) {"sunny"}
      plane3.take_off(weather)
      expect{plane3.take_off(weather)}.to raise_error("Plane has already taken off.")
    end
  end
end
