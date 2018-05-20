require "airport"
describe Airport do
  subject(:airport) { described_class.new }

  describe "#take_off" do
    it "responds to #take_off" do
      allow(airport).to receive(:stormy?).and_return false
      expect(airport).to respond_to(:take_off).with(1).argument
    end
    it "checks if the plane that took_of is no longer in the airport" do
      plane = Plane.new
      allow(airport).to receive(:stormy?).and_return false
      airport.land(plane)
      expect(airport.take_off(plane)).to eq plane
    end
    it "prevents take_off if the weather is stormy" do
      plane = Plane.new
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.take_off(plane) }.to raise_error ' Weather is stormy - cannot take_off! '
    end
  end

  describe "#land" do
    it "responds to #land" do
      allow(airport).to receive(:stormy?).and_return false
      expect(airport).to respond_to(:land).with(1).argument
    end
    it "prevents landing when the weather is stormy" do
      plane = Plane.new
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land(plane) }.to raise_error ' Weather is stormy - cannot land! '
    end
  end

end
