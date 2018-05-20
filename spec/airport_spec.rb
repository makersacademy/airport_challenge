require "airport"
describe Airport do
  subject(:airport) { described_class.new }

  describe "#land" do
    it "responds to #land" do
      expect(airport).to respond_to(:land).with(1).argument
    end
  end

  describe "#take_off" do
    it "responds to #take_off" do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
    it "checks if the plane that took_of is no longer in the airport" do
      plane = Plane.new
      airport.land(plane)
      expect(airport.take_off(plane)).to eq plane
    end
    it "prevents take_off if the weather is stormy" do
      plane = Plane.new
      airport.land(plane)
      expect(airport.take_off(plane)).not_to be_stormy
    end
  end

end
