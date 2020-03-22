require './lib/airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }
  let(:plane2) { double :plane2 }
  let(:plane3) { double :plane3 }

  describe ".new" do
    it "check creates planes array" do
      expect(airport.planes).to eq([])
    end
  end

  describe "#land" do
    it "check responds to #land(plane)" do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it "check #land(plane) adds plane to @planes" do
      airport.land(plane)
      expect(airport.planes).to eq([plane])
    end

    it "check #land(plane) adds multiple planes to @planes" do
      airport.land(plane2)
      airport.land(plane)
      airport.land(plane3)
      expect(airport.planes).to eq([plane2, plane, plane3])
    end
  end

  describe "#take_off" do
    it "check responds to #take_off(plane)" do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

    it "check #take_off(plane) removes plane from simple @planes" do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).to eq([])
    end

    it "check #take_off(plane) removes plane from complicated @planes" do
      airport.land(plane2)
      airport.land(plane)
      airport.land(plane3)
      airport.take_off(plane)
      expect(airport.planes).to eq([plane2, plane3])
    end

    it "Check plane cant take off if no plane at airport" do
      expect { airport.take_off(plane) }.to raise_error("Plane not at airport!")
    end

    it "Check plane cant take off if only other planes at airport" do
      airport.land(plane2)
      airport.land(plane3)
      expect { airport.take_off(plane) }.to raise_error("Plane not at airport!")
    end

  end
end
