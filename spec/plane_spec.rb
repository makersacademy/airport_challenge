require 'plane'

describe Plane do

  let(:plane) { Plane.new }


  describe '#to_land_at' do
    it "respond to to_land_at with 1 argument" do
      expect(plane).to respond_to(:to_land_at).with(1).argument
    end
    it "returns an error when already on the airport" do
      airport = double { "airport" }
      expect(airport).to receive(:planes)
      airport.planes
    end
  end

  describe '#take_off' do
    it "respond to take_off" do
      expect(plane).to respond_to(:take_off).with(1).argument
    end
    it "returns an eror when not on the airport" do
      airport = double { "airport" }
      expect(airport).to receive(:planes)
      airport.planes
    end
  end

end
