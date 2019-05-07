require 'airport'
require 'plane'
require 'weather'

airport = Airport.new
plane = Plane.new
weather = Weather.new

describe Airport do
  describe "#land" do
    it "lands a plane" do
      expect(airport.land(plane)).to eq(plane)
    end
  end
  describe "#take_off" do
    it "takes off a plane" do
      expect(airport).to respond_to(:take_off)
    end
    it "removes the plane from the airport on takeoff" do
        allow(weather).to receive(:status?).and_return(:sunny)
        airport.take_off(weather)
        expect(airport.contain?).to eq(nil)
    end
    it "does not allow the plane to take off if it is stormy" do
        allow(weather).to receive(:status?).and_return(:stormy)
        expect { airport.take_off(weather) }.to raise_error("too dangerous to take off")
    end
  end
end
