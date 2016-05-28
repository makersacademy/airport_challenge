require 'planes'

describe Planes do

let(:weather) {double("weather")}

  describe "#land" do
    it "should land a plane when weather is sunny" do
      plane = Planes.new
      allow(weather).to receive(:report) {"sunny"}
      plane.land(weather)
      expect(plane.at_airport?).to eq true
    end

    it "should not land a plane when weather is stormy" do
      plane = Planes.new
      allow(weather).to receive(:report) {"stormy"}
      plane.land(weather)
      expect(plane.at_airport?).to eq false
    end
  end

  describe "#take_off" do

    it "should take off a plane if weather is sunny" do
      plane = Planes.new
      allow(weather).to receive(:report) {"sunny"}
      plane.take_off(weather)
      expect(plane.at_airport?).to eq false
    end

    it "should not take off a plane if weather is stormy" do
      plane = Planes.new
      allow(weather).to receive(:report) {"stormy"}
      plane.take_off(weather)
      expect(plane.at_airport?).to eq true
    end
  end
end
