require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe "#land" do
    let(:airport) { double :airport }

    it "can instruct a plane to land" do
      expect(plane).to respond_to(:land)
    end
    it "set the airport on landing" do
      plane.land(airport)
      expect(plane.airport).to eq airport
    end
  end

  describe "#takeoff" do
    let(:airport) { double :airport }

    it "can instruct a plane to takeoff" do
      expect(plane).to respond_to(:takeoff)
    end
    it "remove the airport on takeoff" do
      plane.takeoff
      expect(plane.airport).to eq nil
    end
  end

  describe "#airport" do
    let(:airport) { double :airport }

    it "can get a plane's airport" do
      expect(plane).to respond_to(:airport)
    end
    it "returns an airport if landed" do
      plane.land(airport)
      expect(plane.airport).to eq airport
    end
    it "returns nil if in the air" do
      plane.takeoff
      expect(plane.airport).to eq nil
    end
  end

  describe "#landed?" do
    let(:airport) { double :airport }

    it "can tell whether a plane is currently landed" do
      expect(plane).to respond_to(:landed?)
    end
    it "returns false if a plane is currently in the air" do
      plane.takeoff
      expect(plane.landed?).to eq false
    end
    it "returns true if a plane is currently landed" do
      plane.land(airport)
      expect(plane.landed?).to eq true
    end
  end

end
