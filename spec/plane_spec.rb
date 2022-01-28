require_relative '../lib/plane'
require_relative '../lib/airport'

describe Plane do

  describe "#land" do
    it "should land a plane at an airport" do
      plane = Plane.new
      expect(plane).to respond_to(:land)
    end
  end

  describe "#take_off" do

    it "should instruct a plane taking off from an airport" do
      plane = Plane.new
      expect(plane).to respond_to(:take_off)
    end

    it "should confirm that, following take off, the plane is no longer at the airport" do
      plane = Plane.new
      airport = Airport.new
      airport.add_plane(plane)
      plane.take_off(plane, airport)
      expect(plane.take_off(plane, airport)).to eq nil
    end
  end

end
